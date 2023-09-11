import ballerina/io;
import ballerina/lang.regexp;
import ballerina/time;

function readBallerinaRunLogs(string mode) returns int[]|error {

    int[] startupTimes = [];
    string[] logs = check io:fileReadLines("../conference-service-ballerina/run-" + mode + ".txt");
    if logs.length() == 0 {
        return error("No logs found");
    }

    time:Utc? startTime = ();

    foreach string log in logs {
        if log.includes("Executing the Ballerina application") {
            startTime = check getTime(log);
        }
        if log.includes("Startup completed") {
            if startTime is time:Utc {
                time:Utc endTime = check getTime(log);
                decimal startupTime = time:utcDiffSeconds(endTime, startTime) * 1000;
                startupTimes.push(<int>startupTime);
                startTime = ();
            }
        }
    }

    return startupTimes;
}

function getStartupTimes(string filePath, regexp:RegExp filter, string unit = "ms") returns int[]|error {
    string logs = check io:fileReadString(filePath);
    if logs.trim() == "" {
        return error("No logs found");
    }

    return trap filter.findAllGroups(logs).'map(function(regexp:Groups group) returns int {
        regexp:Span? timeSpan = group[1];
        if timeSpan is () {
            panic error("No startup time found");
        }
        string time = timeSpan.substring();
        if (unit == "s") {
            return <int>((checkpanic decimal:fromString(time)) * 1000);
        }
        return checkpanic int:fromString(time);
    });
}

function readTestLogs(string filePath, string name) returns [decimal, decimal][]|error {
    [decimal, decimal][] memoryUsages = [];
    string[] logs = check io:fileReadLines(filePath);
    if logs.length() == 0 {
        return error("No logs found");
    }

    foreach int i in 0 ... logs.length() - 1 {
        if logs[i].includes("Memory usage after ten requests") {
            string log;
            if logs[i + 1].includes(name) {
                log = logs[i + 1];
            } else if logs[i + 2].includes(name) {
                log = logs[i + 2];
            } else {
                return error("No memory usage found");
            }
            [decimal, decimal] memoryUsuage = check getMemoryUsage(log);
            memoryUsages.push(memoryUsuage);
        }
    }
    return memoryUsages;
}

function getMemoryUsage(string log) returns [decimal, decimal]|error {
    regexp:Span[]? memoryGroups = memoryRegex.findAll(log);
    if (memoryGroups is () || memoryGroups.length() < 2) {
        return error("No RSS and/or CPU usage found");
    }
    decimal rss = check decimal:fromString(memoryGroups[0].substring());
    decimal cpu = check decimal:fromString(memoryGroups[1].substring());
    return [rss, cpu];
}

function getThroughput(string fileName) returns decimal|error {
    string[] logs = check io:fileReadLines(fileName);
    if logs.length() == 0 {
        return error("No logs found");
    }

    foreach string log in logs {
        regexp:Groups? throughputGroups = throughputRegex.findGroups(log);
        if (throughputGroups is () || throughputGroups.length() < 1) {
            continue;
        }
        if (throughputGroups.length() >= 2) {
            regexp:Span? throughputGroup = throughputGroups[1];
            if (throughputGroup is ()) {
                return error("No throughput found");
            }
            string throughput = throughputGroup.substring();
            return check decimal:fromString(throughput);
        }
    }
    return error("No throughput found");
}

function getLatency(string fileName) returns string|error {
    string[] logs = check io:fileReadLines(fileName);
    if logs.length() == 0 {
        return error("No logs found");
    }

    foreach string log in logs {
        regexp:Groups? latencyGroups = latencyRegex.findGroups(log);
        if (latencyGroups is () || latencyGroups.length() < 1) {
            continue;
        }
        if (latencyGroups.length() >= 2) {
            regexp:Span? latencyGroup = latencyGroups[1];
            if (latencyGroup is ()) {
                return error("No latency found");
            }
            string latency = latencyGroup.substring();
            return latency;
        }
    }
    return error("No latency found");
}
