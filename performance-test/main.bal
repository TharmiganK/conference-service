import ballerina/os;

public function main(string? mode) returns error? {
    os:Process performTest = check os:exec({value: "python3", arguments: ["performTest.py"]});
    int _ = check performTest.waitForExit();

    check printBallerinaPerformance(mode);
    check printMicronautPerformance(mode);
    check printQuarkusPerformance(mode);
    check printSpringbootPerformance(mode);
}