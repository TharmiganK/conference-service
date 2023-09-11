function printMicronautPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../conference-service-micronaut/run-" + (mode ?: "jvm") + ".txt", re `Startup completed in (\d+(\.\d+)?)`);
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-micronaut/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_micronaut");
    decimal throughput = check getThroughput("../conference-service-micronaut/throughput-" + (mode ?: "jvm") + ".txt");
    string latency = check getLatency("../conference-service-micronaut/latency-" + (mode ?: "jvm") + ".txt");
    check printPerfMatrix("Micronaut", startupTimes, memoryUsages, throughput, latency);
}

function printQuarkusPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../conference-service-quarkus/run-" + (mode ?: "jvm") + ".txt", re `started in (\d+(\.\d+)?)`, "s");
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-quarkus/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_quarkus");
    decimal throughput = check getThroughput("../conference-service-quarkus/throughput-" + (mode ?: "jvm") + ".txt");
    string latency = check getLatency("../conference-service-quarkus/latency-" + (mode ?: "jvm") + ".txt");
    check printPerfMatrix("Quarkus", startupTimes, memoryUsages, throughput, latency);
}

function printSpringbootPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../conference-service-springboot/run-" + (mode ?: "jvm") + ".txt", re `Started ConferenceServiceApplication in (\d+(\.\d+)?)`, "s");
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-springboot/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_springboot");
    decimal throughput = check getThroughput("../conference-service-springboot/throughput-" + (mode ?: "jvm") + ".txt");
    string latency = check getLatency("../conference-service-springboot/latency-" + (mode ?: "jvm") + ".txt");
    check printPerfMatrix("Springboot", startupTimes, memoryUsages, throughput, latency);
}

function printBallerinaPerformance(string? mode) returns error? {
    int[] startupTimes = check readBallerinaRunLogs((mode ?: "jvm"));
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-ballerina/test-" + (mode ?: "jvm") + ".txt", "./target/bin/conference_service_ballerina");
    decimal throughput = check getThroughput("../conference-service-ballerina/throughput-" + (mode ?: "jvm") + ".txt");
    string latency = check getLatency("../conference-service-ballerina/latency-" + (mode ?: "jvm") + ".txt");
    check printPerfMatrix("Ballerina", startupTimes, memoryUsages, throughput, latency);
}
