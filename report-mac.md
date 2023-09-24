# Performance Comparison Report

## GraalVM Build

|        | Build Time | Executable size |
|--------|:----------:|:---------------:|
| Ballerina | 2m 4s | 145.24MB |
| Micronaut | 1m 42s | 95.92MB |
| Quarkus | 1m 45s | 98.17MB |
| Spring Boot | 2m 26s | 134.18MB |

## Average Startup Time

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 738ms | 186ms |
| Micronaut | 1142ms | 85ms |
| Quarkus | 1396ms | 111ms |
| Spring Boot | 2358ms | 169ms |

## Max Memory Footprint

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 208.641MB | 92.9688MB |
| Micronaut | 269.281MB | 116.234MB |
| Quarkus | 289.312MB | 93.1562MB |
| Spring Boot | 322.578MB | 144.578MB |

## Max CPU Usage

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 101.8% | 2.9% |
| Micronaut | 135.5% | 5.8% |
| Quarkus | 139.8% | 4.6% |
| Spring Boot | 69.4% | 1.9% |

## Max Throughput

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 3883.98 requests/sec | 2780.72 requests/sec |
| Micronaut | 1488.60 requests/sec | 1468.10 requests/sec |
| Quarkus | 2334.89 requests/sec | 2244.46 requests/sec |
| Spring Boot | 1493.65 requests/sec | 1457.05 requests/sec |

## Latency

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 9.46ms | 10.55ms |
| Micronaut | 16.18ms | 18.25ms |
| Quarkus | 23.71ms | 27.14ms |
| Spring Boot | 18.96ms | 24.70ms |
