# Performance Comparison Report

## GraalVM Build

|        | Build Time | Executable size |
|--------|:----------:|:---------------:|
| Ballerina | 3m 31s | 157.44MB |
| Micronaut | 2m 31s | 127.03MB |
| Quarkus | 1m 49s | 100.85MB |
| Spring Boot | 2m 55s | 134.72MB |

## Average Startup Time

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 883ms | 268ms |
| Micronaut | 1152ms | 102ms |
| Quarkus | 1351ms | 140ms |
| Spring Boot | 2484ms | 175ms |

## Max Memory Footprint

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 223.031MB | 117.781MB |
| Micronaut | 268.656MB | 144.594MB |
| Quarkus | 271.266MB | 85.2031MB |
| Spring Boot | 274.422MB | 150.703MB |

## Max CPU Usage

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 102.3% | 7.3% |
| Micronaut | 134.6% | 8.2% |
| Quarkus | 146.9% | 5.0% |
| Spring Boot | 69.6% | 1.8% |

## Max Throughput

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 4149.80 requests/sec | 2740.10 requests/sec |
| Micronaut | 1515.17 requests/sec | 1304.72 requests/sec |
| Quarkus | 628.11 requests/sec | 2139.54 requests/sec |
| Spring Boot | 1472.88 requests/sec | 87.65 requests/sec |

## Latency

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 7.20ms | 13.78ms |
| Micronaut | 14.29ms | 29.50ms |
| Quarkus | 14.02ms | 21.30ms |
| Spring Boot | 23.67s | 0.00us |

