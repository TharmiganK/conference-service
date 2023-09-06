function printMicronautPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../conference-service-micronaut/run-" + (mode ?: "jvm") + ".txt", re `Startup completed in (\d+(\.\d+)?)`);
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-micronaut/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_micronaut");
    check printPerfMatrix("Micronaut", startupTimes, memoryUsages);
}

function printQuarkusPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../conference-service-quarkus/run-" + (mode ?: "jvm") + ".txt", re `started in (\d+(\.\d+)?)`, "s");
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-quarkus/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_quarkus");
    check printPerfMatrix("Quarkus", startupTimes, memoryUsages);
}

function printSpringbootPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../conference-service-springboot/run-" + (mode ?: "jvm") + ".txt", re `Started ConferenceServiceApplication in (\d+(\.\d+)?)`, "s");
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-springboot/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_springboot");
    check printPerfMatrix("Springboot", startupTimes, memoryUsages);
}

function printBallerinaPerformance(string? mode) returns error? {
    int[] startupTimes = check readBallerinaRunLogs((mode ?: "jvm"));
    [decimal, decimal][] memoryUsages = check readTestLogs("../conference-service-ballerina/test-" + (mode ?: "jvm") + ".txt", "./target/bin/conference_service_ballerina");
    check printPerfMatrix("Ballerina", startupTimes, memoryUsages);
}
