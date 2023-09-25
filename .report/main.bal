public function main() returns error? {
    ComparisonMatrix performanceMatrix = {
        ballerina: {
            jit: check getBallerinaPerformance("jvm"),
            graalvm: check getBallerinaPerformance("graalvm")
        },
        micronaut: {
            jit: check getMicronautPerformance("jvm"),
            graalvm: check getMicronautPerformance("graalvm")
        },
        quarkus: {
            jit: check getQuarkusPerformance("jvm"),
            graalvm: check getQuarkusPerformance("graalvm")
        },
        springboot: {
            jit: check getSpringbootPerformance("jvm"),
            graalvm: check getSpringbootPerformance("graalvm")
        }
    };

    check createReport(performanceMatrix);
}
