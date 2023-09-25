# Performance Comparison Report

## GraalVM Build

|        | Build Time | Executable size |
|--------|:----------:|:---------------:|
| Ballerina | 4m 54s | 159.57MB |
| Micronaut | 4m 14s | 104.76MB |
| Quarkus | 4m 10s | 99.96MB |
| Spring Boot | 5m 48s | 144.69MB |

## Average Startup Time

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 1000ms | 80ms |
| Micronaut | 1499ms | 77ms |
| Quarkus | 2040ms | 117ms |
| Spring Boot | 3418ms | 171ms |

## Max Memory Footprint

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 212.488MB | 119.121MB |
| Micronaut | 271.105MB | 139.773MB |
| Quarkus | 262.902MB | 111.68MB |
| Spring Boot | 283.586MB | 180.215MB |

## Max CPU Usage

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 16.7% | 0.4% |
| Micronaut | 32.5% | 1.0% |
| Quarkus | 32.5% | 0.6% |
| Spring Boot | 55.9% | 1.6% |

## Max Throughput

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 2022.70 requests/sec | 1386.78 requests/sec |
| Micronaut | 5336.26 requests/sec | 4402.70 requests/sec |
| Quarkus | 4993.67 requests/sec | 4640.32 requests/sec |
| Spring Boot | 4838.77 requests/sec | 4086.71 requests/sec |

## Latency

|        | JIT | GraalVM native executable |
|--------|:---:|:-------------------------:|
| Ballerina | 106.62ms | 265.21ms |
| Micronaut | 14.10ms | 39.52ms |
| Quarkus | 20.67ms | 39.68ms |
| Spring Boot | 8.76ms | 54.46ms |
