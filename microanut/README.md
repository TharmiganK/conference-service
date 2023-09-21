# Conference Service - Micronaut version

This directory contains the Micronaut version of the Conference Service.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Build and Run the service locally](#build-and-run-the-service-locally)
- [Build and Run the service in a Docker container](#build-and-run-the-service-in-a-docker-container)
- [Test performance](#test-performance)

## Prerequisites

- Install [VSCode](https://code.visualstudio.com/) with the [REST Client extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).
- Install GraalVM.
- Install [Docker](https://docs.docker.com/get-docker/).
- Run the docker compose file to start the `country-service` and the mysql database.

  ```console
  $ docker compose up -d

  [+] Running 3/3
   ✔ Network micronaut_default  Created                   0.0s 
   ✔ Container conferencedb     Started                   0.6s 
   ✔ Container country-service  Started                   0.4s 
  ```

## Build and Run the service locally

### JAR file

- Build the JAR file using the following command.

  ```console
  $ ./mvnw package
  ```

- Run the following command to execute the JAR file.

  ```console
  $ java -jar ./target/conference_service_micronaut-1.0.jar

   __  __ _                                  _   
  |  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
  | |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
  | |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
  |_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
    Micronaut (v3.10.1)

  15:24:10.326 [main] INFO 
                  org.hibernate.Version - HHH000412: Hibernate ORM core version [WORKING]
  15:24:10.401 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
  15:24:10.596 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
  15:24:10.608 [main] INFO 
                  o.h.annotations.common.Version - HCANN000001: Hibernate Commons Annotations {5.1.2.Final}
  15:24:10.651 [main] INFO 
                  org.hibernate.dialect.Dialect - HHH000400: Using dialect: org.hibernate.dialect.MySQL8Dialect
  15:24:11.058 [main] INFO 
                  io.micronaut.runtime.Micronaut - Startup completed in 1023ms. Server Running: http://localhost:8101
  ```

- Test the service by sending the request using the `requests.http` file.

### GraalVM native executable

- Run the following command to build the native executable. The executable will be created in the `target/bin` directory.

  ```console
  $ ./mvnw package -Dpackaging=native-image
  ```

- Run the executable directly.

  ```console
  $ ./target/conference_service_micronaut

   __  __ _                                  _   
  |  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
  | |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
  | |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
  |_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
    Micronaut (v3.10.1)

  15:27:14.425 [main] INFO 
                  org.hibernate.Version - HHH000412: Hibernate ORM core version 5.6.15.Final
  15:27:14.428 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
  15:27:14.464 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
  15:27:14.466 [main] INFO 
                  o.h.annotations.common.Version - HCANN000001: Hibernate Commons Annotations {5.1.2.Final}
  15:27:14.468 [main] INFO 
                  org.hibernate.dialect.Dialect - HHH000400: Using dialect: org.hibernate.dialect.MySQL8Dialect
  15:27:14.494 [main] INFO 
                  io.micronaut.runtime.Micronaut - Startup completed in 90ms. Server Running: http://localhost:8101
  ```

- Test the service by sending the request using the `requests.http` file.

## Build and Run the service in a Docker container

### Docker image containing the JAR file

- Run the following command to build a docker image containing the JAR file.

  ```console
  $ ./mvnw package -Dpackaging=docker
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-micronaut --network host --rm conference_service_micronaut:latest

   __  __ _                                  _   
  |  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
  | |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
  | |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
  |_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
    Micronaut (v3.10.1)

  09:58:43.050 [main] INFO 
                  org.hibernate.Version - HHH000412: Hibernate ORM core version 5.6.15.Final
  09:58:43.945 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
  09:58:45.794 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
  09:58:45.922 [main] INFO 
                  o.h.annotations.common.Version - HCANN000001: Hibernate Commons Annotations {5.1.2.Final}
  09:58:46.599 [main] INFO 
                  org.hibernate.dialect.Dialect - HHH000400: Using dialect: org.hibernate.dialect.MySQL8Dialect
  09:58:51.814 [main] INFO 
                  io.micronaut.runtime.Micronaut - Startup completed in 14262ms. Server Running: http://lima-rancher-desktop:8101
  ```

- Test the service by sending the request using the `requests.http` file.

### Docker image containing the GraalVM executable

- Run the following command to build a docker image containing the GraalVM executable.

  ```console
  $ ./mvnw package -Dpackaging=docker-native -Pgraalvm
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-micronaut --network host --rm conference_service_micronaut:latest

   __  __ _                                  _   
  |  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
  | |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
  | |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
  |_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
    Micronaut (v3.10.1)

  06:00:49.117 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
  06:00:49.162 [main] INFO 
                  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
  06:00:49.171 [main] INFO 
                  org.hibernate.Version - HHH000412: Hibernate ORM core version 5.6.15.Final
  06:00:49.176 [main] INFO 
                  o.h.annotations.common.Version - HCANN000001: Hibernate Commons Annotations {5.1.2.Final}
  06:00:49.182 [main] INFO 
                  org.hibernate.dialect.Dialect - HHH000400: Using dialect: org.hibernate.dialect.MySQL8Dialect
  06:00:49.290 [main] INFO 
                  io.micronaut.runtime.Micronaut - Startup completed in 1211ms. Server Running: http://lima-rancher-desktop:8101
  ```

- Test the service by sending the request using the `requests.http` file.

## Test performance

### Startup time

The startup time will be printed in the console when the service is started.

```console
15:27:14.494 [main] INFO 
                io.micronaut.runtime.Micronaut - Startup completed in 90ms. Server Running: http://localhost:8101
```

### Memory and CPU usage

Run the following command to get the CPU and memory usage of the application.

```console
$ ps aux | grep conference_service_micronaut | grep -v grep | awk '{$6="RSS:"($6/1024)"M";}{$3="CPU:"$3"%";}{print $3, $6;}'

CPU:0.0% RSS:83.0156M
```

### Throughput

- Install [`wrk`](https://github.com/wg/wrk)
- Run the following command to get the throughput

  ```console
  $ wrk -t5 -c100 -d3m http://localhost:8101/conferences

  Running 3m test @ http://localhost:8101/conferences
    5 threads and 100 connections
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency    67.74ms   26.85ms 366.14ms   76.06%
      Req/Sec   298.53     55.14   474.00     70.46%
    267528 requests in 3.00m, 33.93MB read
  Requests/sec:   1485.52
  Transfer/sec:    192.94KB
  ```
  
  > **Note:** This benchmark runs for 3 minutes with 5 threads and 100 connections.

### Latency

- Install [`wrk2`](https://github.com/giltene/wrk2)
- Run the following command to get the latency

  ```console
  $ wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8101/conferences

  Running 3m test @ http://localhost:8101/conferences
    5 threads and 100 connections
    Thread calibration: mean lat.: 9.141ms, rate sampling interval: 25ms
    Thread calibration: mean lat.: 8.767ms, rate sampling interval: 25ms
    Thread calibration: mean lat.: 8.987ms, rate sampling interval: 25ms
    Thread calibration: mean lat.: 8.951ms, rate sampling interval: 25ms
    Thread calibration: mean lat.: 8.719ms, rate sampling interval: 25ms
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency     9.00ms   20.47ms 783.36ms   96.79%
      Req/Sec   204.05     41.79   600.00     74.92%
    Latency Distribution (HdrHistogram - Recorded Latency)
  50.000%    5.51ms
  75.000%    6.87ms
  90.000%   12.49ms
  99.000%   66.75ms
  99.900%  287.23ms
  99.990%  683.52ms
  99.999%  758.78ms
  100.000%  783.87ms
  ```

  > **Note:** This benchmark runs for 3 minutes with 5 threads, 100 connections and 1000 requests per second.
