type PerformanceMatrix record {|
    int startupTime;
    decimal rss;
    decimal cpu;
|};

type OutputMatrix record {|
    string avgStartupTime;
    string maxRss;
    string maxCpu;
    string maxThroughput;
    string latency;
    string? buildTime;
    string? imageSize;
|};

type Matrix record {|
    OutputMatrix jit;
    OutputMatrix graalvm;
|};

type ComparisonMatrix record {|
    Matrix ballerina;
    Matrix micronaut;
    Matrix quarkus;
    Matrix springboot;
|};
