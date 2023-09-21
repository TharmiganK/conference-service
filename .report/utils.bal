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

function getOutputMatrix(string name, int[] startupTimes, [decimal, decimal][] memoryUsages, string throughput, string latency, string? buildTime, string? executableSize) returns OutputMatrix|error {
    PerformanceMatrix[] ballerinaPerfMatrix = from int i in 0 ... startupTimes.length() - 1
        select {
            startupTime: startupTimes[i],
            rss: memoryUsages[i][1],
            cpu: memoryUsages[i][0]
        };
    int averageStartupTime = from var {startupTime} in ballerinaPerfMatrix
        collect sum(startupTime) / ballerinaPerfMatrix.length();
    decimal maxRss = from var {rss} in ballerinaPerfMatrix
        collect max(rss) ?: 0.0d;
    decimal maxCpuUsuage = from var {cpu} in ballerinaPerfMatrix
        collect max(cpu) ?: 0.0d;

    return {
        avgStartupTime: string `${averageStartupTime}ms`,
        maxRss: string `${maxRss}MB`,
        maxCpu: string `${maxCpuUsuage}%`,
        maxThroughput: throughput,
        latency: latency,
        buildTime: buildTime,
        imageSize: executableSize
    };
}

function createReport(ComparisonMatrix perfMatrix) returns error? {
    string[] content = [];
    content.push("# Performance Comparison Report");
    content.push("\n");
    content.push("## GraalVM Build");
    content.push("\n");
    content.push("|        | Build Time | Executable size |");
    content.push("|--------|:----------:|:---------------:|");
    content.push(string`| Ballerina | ${perfMatrix.ballerina.graalvm.buildTime ?: "N/A"} | ${perfMatrix.ballerina.graalvm.imageSize ?: "N/A"} |`);
    content.push(string`| Micronaut | ${perfMatrix.micronaut.graalvm.buildTime ?: "N/A"} | ${perfMatrix.micronaut.graalvm.imageSize ?: "N/A"} |`);
    content.push(string`| Quarkus | ${perfMatrix.quarkus.graalvm.buildTime ?: "N/A"} | ${perfMatrix.quarkus.graalvm.imageSize ?: "N/A"} |`);
    content.push(string`| Spring Boot | ${perfMatrix.springboot.graalvm.buildTime ?: "N/A"} | ${perfMatrix.springboot.graalvm.imageSize ?: "N/A"} |`);
    content.push("\n");
    content.push("## Average Startup Time");
    content.push("\n");
    content.push("|        | JIT | GraalVM native executable |");
    content.push("|--------|:---:|:-------------------------:|");
    content.push(string`| Ballerina | ${perfMatrix.ballerina.jit.avgStartupTime} | ${perfMatrix.ballerina.graalvm.avgStartupTime} |`);
    content.push(string`| Micronaut | ${perfMatrix.micronaut.jit.avgStartupTime} | ${perfMatrix.micronaut.graalvm.avgStartupTime} |`);
    content.push(string`| Quarkus | ${perfMatrix.quarkus.jit.avgStartupTime} | ${perfMatrix.quarkus.graalvm.avgStartupTime} |`);
    content.push(string`| Spring Boot | ${perfMatrix.springboot.jit.avgStartupTime} | ${perfMatrix.springboot.graalvm.avgStartupTime} |`);
    content.push("\n");
    content.push("## Max Memory Footprint");
    content.push("\n");
    content.push("|        | JIT | GraalVM native executable |");
    content.push("|--------|:---:|:-------------------------:|");
    content.push(string`| Ballerina | ${perfMatrix.ballerina.jit.maxRss} | ${perfMatrix.ballerina.graalvm.maxRss} |`);
    content.push(string`| Micronaut | ${perfMatrix.micronaut.jit.maxRss} | ${perfMatrix.micronaut.graalvm.maxRss} |`);
    content.push(string`| Quarkus | ${perfMatrix.quarkus.jit.maxRss} | ${perfMatrix.quarkus.graalvm.maxRss} |`);
    content.push(string`| Spring Boot | ${perfMatrix.springboot.jit.maxRss} | ${perfMatrix.springboot.graalvm.maxRss} |`);
    content.push("\n");
    content.push("## Max CPU Usage");
    content.push("\n");
    content.push("|        | JIT | GraalVM native executable |");
    content.push("|--------|:---:|:-------------------------:|");
    content.push(string`| Ballerina | ${perfMatrix.ballerina.jit.maxCpu} | ${perfMatrix.ballerina.graalvm.maxCpu} |`);
    content.push(string`| Micronaut | ${perfMatrix.micronaut.jit.maxCpu} | ${perfMatrix.micronaut.graalvm.maxCpu} |`);
    content.push(string`| Quarkus | ${perfMatrix.quarkus.jit.maxCpu} | ${perfMatrix.quarkus.graalvm.maxCpu} |`);
    content.push(string`| Spring Boot | ${perfMatrix.springboot.jit.maxCpu} | ${perfMatrix.springboot.graalvm.maxCpu} |`);
    content.push("\n");
    content.push("## Max Throughput");
    content.push("\n");
    content.push("|        | JIT | GraalVM native executable |");
    content.push("|--------|:---:|:-------------------------:|");
    content.push(string`| Ballerina | ${perfMatrix.ballerina.jit.maxThroughput} | ${perfMatrix.ballerina.graalvm.maxThroughput} |`);
    content.push(string`| Micronaut | ${perfMatrix.micronaut.jit.maxThroughput} | ${perfMatrix.micronaut.graalvm.maxThroughput} |`);
    content.push(string`| Quarkus | ${perfMatrix.quarkus.jit.maxThroughput} | ${perfMatrix.quarkus.graalvm.maxThroughput} |`);
    content.push(string`| Spring Boot | ${perfMatrix.springboot.jit.maxThroughput} | ${perfMatrix.springboot.graalvm.maxThroughput} |`);
    content.push("\n");
    content.push("## Latency");
    content.push("\n");
    content.push("|        | JIT | GraalVM native executable |");
    content.push("|--------|:---:|:-------------------------:|");
    content.push(string`| Ballerina | ${perfMatrix.ballerina.jit.latency} | ${perfMatrix.ballerina.graalvm.latency} |`);
    content.push(string`| Micronaut | ${perfMatrix.micronaut.jit.latency} | ${perfMatrix.micronaut.graalvm.latency} |`);
    content.push(string`| Quarkus | ${perfMatrix.quarkus.jit.latency} | ${perfMatrix.quarkus.graalvm.latency} |`);
    content.push(string`| Spring Boot | ${perfMatrix.springboot.jit.latency} | ${perfMatrix.springboot.graalvm.latency} |`);
    content.push("\n");

    string report = string:'join("\n", ...content);
    check io:fileWriteString("../report.md", report);
}
