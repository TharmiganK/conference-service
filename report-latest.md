# Performance Comparison Report

## Versions

- **Ballerina:** SwanLake Update 9(2201.9.0)
- **Micronaut:** 4.4.2 (Java 17)
- **Quarkus:** 3.10.0 (Java 17)
- **Spring Boot:** 3.2.5 (Java 17)

## GraalVM CE Build

|        | Build Time | Executable size |
|--------|:----------:|:---------------:|
| Ballerina | 2m 50s | 176.22MB |
| Micronaut | 2m 57s | 141.17MB |
| Quarkus | 2m 18s | 102.69MB |
| Spring Boot | 3m 20s | 146.19MB |

## Oracle GraalVM Build

|        | Build Time | Executable size |
|--------|:----------:|:---------------:|
| Ballerina | 5m 23s | 193.23MB |
| Micronaut | 5m 24s | 164.57MB |
| Quarkus | 4m 21s | 117.12MB |
| Spring Boot | 5m 52s | 167.07MB |

## Average Startup Time

|        | JIT | GraalVM CE | Oracle GraalVM |
|--------|:---:|:----------:| :-------------:|
| Ballerina | 1299ms | 74ms | 78ms |
| Micronaut | 1644ms | 72ms | 69ms |
| Quarkus | 1961ms | 79ms | 70ms |
| Spring Boot | 3681ms | 182ms | 167ms |

## Max Memory Footprint

|        | JIT | GraalVM CE | Oracle GraalVM |
|--------|:---:|:----------:| :-------------:|
| Ballerina | 219.215MB | 146.617MB | 135.168MB |
| Micronaut | 251.984MB | 171.996MB | 164.668MB |
| Quarkus | 260.352MB | 98.4805MB | 95.6484MB |
| Spring Boot | 275.27MB | 175.777MB | 180.07MB |

## Max CPU Usage

|        | JIT | GraalVM CE | Oracle GraalVM |
|--------|:---:|:----------:| :-------------:|
| Ballerina | 28.0% | 0.8% | 0.8% |
| Micronaut | 45.0% | 1.0% | 0.8% |
| Quarkus | 41.6% | 0.3% | 0.2% |
| Spring Boot | 74.0% | 1.4% | 1.2% |

## Max Throughput

|        | JIT | GraalVM CE | Oracle GraalVM |
|--------|:---:|:----------:| :-------------:|
| Ballerina | 2772.06 requests/sec | 1822.53 requests/sec | 2347.73 requests/sec |
| Micronaut | 6153.17 requests/sec | 4618.19 requests/sec | 4676.88 requests/sec |
| Quarkus | 7234.93 requests/sec | 5603.40 requests/sec | 6183.93 requests/sec |
| Spring Boot | 5533.97 requests/sec | 4304.99 requests/sec | 4411.82 requests/sec |

## Latency

|        | JIT | GraalVM CE | Oracle GraalVM |
|--------|:---:|:----------:| :-------------:|
| Ballerina | 9.81ms | 43.78ms | 25.73ms |
| Micronaut | 6.95ms | 6.64ms | 5.31ms |
| Quarkus | 3.36ms | 5.85ms | 7.44ms |
| Spring Boot | 5.31ms | 22.70ms | 17.85ms |
