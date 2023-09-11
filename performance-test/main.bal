public function main(string? mode) returns error? {
    check printBallerinaPerformance(mode);
    check printMicronautPerformance(mode);
    check printQuarkusPerformance(mode);
    check printSpringbootPerformance(mode);
}
