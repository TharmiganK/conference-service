import ballerina/lang.regexp;
import ballerina/time;
import ballerina/io;

function getTime(string log) returns time:Utc|error {
    regexp:Span? timeSpan = timeRegex.find(log);
    if timeSpan is () {
        return error("No timestamp found");
    }
    string timestamp = timeSpan.substring();
    time:Civil civilFromString = check time:civilFromString(timestamp);
    return check time:utcFromCivil(civilFromString);
}

function printPerfMatrix(string name, int[] startupTimes, [decimal, decimal][] memoryUsages, decimal throughput, string latency) returns error? {
    PerformanceMatrix[] ballerinaPerfMatrix = from int i in 0 ... startupTimes.length() - 1
        select {
            startupTime: startupTimes[i],
            rss: memoryUsages[i][1],
            cpu: memoryUsages[i][0],
            throughput: throughput,
            latency: latency
        };
    int averageStartupTime = from var {startupTime} in ballerinaPerfMatrix
        collect sum(startupTime) / ballerinaPerfMatrix.length();
    decimal maxRss = from var {rss} in ballerinaPerfMatrix
        collect max(rss) ?: 0.0d;
    decimal maxCpuUsuage = from var {cpu} in ballerinaPerfMatrix
        collect max(cpu) ?: 0.0d;
    io:println("----------------------------------------");
    io:println(name + " performance");
    io:println("----------------------------------------");
    io:println("Average startup time: " + averageStartupTime.toString() + "ms");
    io:println("Max RSS: " + maxRss.toString() + "MB");
    io:println("Max CPU Percentage: " + maxCpuUsuage.toString() + "%");
    io:println("Throughput: " + throughput.toString() + " requests/sec");
    io:println("Latency: " + latency);
    io:println("----------------------------------------\n");
}
