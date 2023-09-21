function printMicronautPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../micronaut/.results/run-" + (mode ?: "jvm") + ".txt", re `Startup completed in (\d+(\.\d+)?)`);
    [decimal, decimal][] memoryUsages = check readTestLogs("../micronaut/.results/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_micronaut");
    string throughput = check getInfo("throughput", "../micronaut/.results/throughput-" + (mode ?: "jvm") + ".txt", throughputRegex);
    string latency = check getInfo("latency", "../micronaut/.results/latency-" + (mode ?: "jvm") + ".txt", latencyRegex);
    string? buildTime = mode == "graalvm" ? check getInfo("build time", "../micronaut/.results/build-graalvm.txt", buildTimeRegex) : ();
    string? executableSize = mode == "graalvm" ? check getInfo("executable size", "../micronaut/.results/build-graalvm.txt", executableSizeRegex) : ();
    check printPerfMatrix("Micronaut", startupTimes, memoryUsages, throughput, latency, buildTime, executableSize);
}

function printQuarkusPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../quarkus/.results/run-" + (mode ?: "jvm") + ".txt", re `started in (\d+(\.\d+)?)`, "s");
    [decimal, decimal][] memoryUsages = check readTestLogs("../quarkus/.results/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_quarkus");
    string throughput = check getInfo("throughput", "../quarkus/.results/throughput-" + (mode ?: "jvm") + ".txt", throughputRegex);
    string latency = check getInfo("latency", "../quarkus/.results/latency-" + (mode ?: "jvm") + ".txt", latencyRegex);
    string? buildTime = mode == "graalvm" ? check getInfo("build time", "../quarkus/.results/build-graalvm.txt", buildTimeRegex) : ();
    string? executableSize = mode == "graalvm" ? check getInfo("executable size", "../quarkus/.results/build-graalvm.txt", executableSizeRegex) : ();
    check printPerfMatrix("Quarkus", startupTimes, memoryUsages, throughput, latency, buildTime, executableSize);
}

function printSpringbootPerformance(string? mode) returns error? {
    int[] startupTimes = check getStartupTimes("../spring-boot/.results/run-" + (mode ?: "jvm") + ".txt", re `Started ConferenceServiceApplication in (\d+(\.\d+)?)`, "s");
    [decimal, decimal][] memoryUsages = check readTestLogs("../spring-boot/.results/test-" + (mode ?: "jvm") + ".txt", "./target/conference_service_springboot");
    string throughput = check getInfo("throughput", "../spring-boot/.results/throughput-" + (mode ?: "jvm") + ".txt", throughputRegex);
    string latency = check getInfo("latency", "../spring-boot/.results/latency-" + (mode ?: "jvm") + ".txt", latencyRegex);
    string? buildTime = mode == "graalvm" ? check getInfo("build time", "../spring-boot/.results/build-graalvm.txt", buildTimeRegex) : ();
    string? executableSize = mode == "graalvm" ? check getInfo("executable size", "../spring-boot/.results/build-graalvm.txt", executableSizeRegex) : ();
    check printPerfMatrix("Spring Boot", startupTimes, memoryUsages, throughput, latency, buildTime, executableSize);
}

function printBallerinaPerformance(string? mode) returns error? {
    int[] startupTimes = check readBallerinaRunLogs((mode ?: "jvm"));
    string throughput = check getInfo("throughput", "../ballerina/.results/throughput-" + (mode ?: "jvm") + ".txt", throughputRegex);
    string latency = check getInfo("latency", "../ballerina/.results/latency-" + (mode ?: "jvm") + ".txt", latencyRegex);
    [decimal, decimal][] memoryUsages = check readTestLogs("../ballerina/.results/test-" + (mode ?: "jvm") + ".txt", "conference_service_ballerina");
    string? buildTime = mode == "graalvm" ? check getInfo("build time", "../ballerina/.results/build-graalvm.txt", buildTimeRegex) : ();
    string? executableSize = mode == "graalvm" ? check getInfo("executable size", "../ballerina/.results/build-graalvm.txt", executableSizeRegex) : ();
    check printPerfMatrix("Ballerina", startupTimes, memoryUsages, throughput, latency, buildTime, executableSize);
}
