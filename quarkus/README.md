# Conference Service - Quarkus version

This directory contains the Quarkus version of the Conference Service.

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
   ✔ Network quarkus_default  Created                   0.0s 
   ✔ Container conferencedb     Started                   0.6s 
   ✔ Container country-service  Started                   0.4s 
  ```

## Build and Run the service locally

### JAR file

- Build the JAR file using the following command.

  ```console
  $ ./mvnw package -Dquarkus.package.type=uber-jar
  ```

- Run the following command to execute the JAR file.

  ```console
  $ java -jar ./target/conference_service_quarkus-1.0.0-runner.jar

  __  ____  __  _____   ___  __ ____  ______ 
  --/ __ \/ / / / _ | / _ \/ //_/ / / / __/ 
  -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \   
  --\___\_\____/_/ |_/_/|_/_/|_|\____/___/   
  2023-09-21 12:54:32,403 INFO  [io.quarkus] (main) conference_service_quarkus 1.0.0 on JVM (powered by Quarkus 3.3.1) started in 1.377s. Listening on: http://0.0.0.0:8100
  2023-09-21 12:54:32,405 INFO  [io.quarkus] (main) Profile prod activated. 
  2023-09-21 12:54:32,405 INFO  [io.quarkus] (main) Installed features: [agroal, cdi, hibernate-orm, hibernate-validator, jdbc-mysql, narayana-jta, rest-client, rest-client-jackson, resteasy, resteasy-jackson, resteasy-jsonb, smallrye-context-propagation, smallrye-fault-tolerance, vertx]
  ```

- Test the service by sending the request using the `requests.http` file.

### GraalVM native executable

- Run the following command to build the native executable. The executable will be created in the `target/bin` directory.

  ```console
  $ ./mvnw install -Dnative -Dquarkus.native.builder-image=graalvm
  ```

- Run the executable directly.

  ```console
  $ ./target/conference_service_quarkus-1.0.0-runner

  __  ____  __  _____   ___  __ ____  ______ 
  --/ __ \/ / / / _ | / _ \/ //_/ / / / __/ 
  -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \   
  --\___\_\____/_/ |_/_/|_/_/|_|\____/___/   
  2023-09-21 13:04:42,503 INFO  [io.quarkus] (main) conference_service_quarkus 1.0.0 native (powered by Quarkus 3.3.1) started in 0.201s. Listening on: http://0.0.0.0:8100
  2023-09-21 13:04:42,504 INFO  [io.quarkus] (main) Profile prod activated. 
  2023-09-21 13:04:42,504 INFO  [io.quarkus] (main) Installed features: [agroal, cdi, hibernate-orm, hibernate-validator, jdbc-mysql, narayana-jta, rest-client, rest-client-jackson, resteasy, resteasy-jackson, resteasy-jsonb, smallrye-context-propagation, smallrye-fault-tolerance, vertx]
  ```

- Test the service by sending the request using the `requests.http` file.

## Build and Run the service in a Docker container

### Docker image containing the JAR file

- Run the following command to build a docker image containing the JAR file.

  ```console
  $ ./mvnw install -Dquarkus.container-image.build=true
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-quarkus --network=host --rm $(id -un)/conference_service_quarkus:1.0.0

  __  ____  __  _____   ___  __ ____  ______ 
  --/ __ \/ / / / _ | / _ \/ //_/ / / / __/ 
  -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \   
  --\___\_\____/_/ |_/_/|_/_/|_|\____/___/   
  2023-09-21 07:36:40,557 INFO  [io.quarkus] (main) conference_service_quarkus 1.0.0 on JVM (powered by Quarkus 3.3.1) started in 1.382s. Listening on: http://0.0.0.0:8100
  2023-09-21 07:36:40,557 INFO  [io.quarkus] (main) Profile prod activated. 
  2023-09-21 07:36:40,558 INFO  [io.quarkus] (main) Installed features: [agroal, cdi, hibernate-orm, hibernate-validator, jdbc-mysql, narayana-jta, rest-client, rest-client-jackson, resteasy, resteasy-jackson, resteasy-jsonb, smallrye-context-propagation, smallrye-fault-tolerance, vertx]
  ```

- Test the service by sending the request using the `requests.http` file.

### Docker image containing the GraalVM executable

- Run the following command to build a docker image containing the GraalVM executable.

  ```console
  $ ./mvnw install -Dnative -Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-graalvmce-builder-image:22.3-java17 -Dquarkus.native.container-runtime=docker -Dquarkus.container-image.build=true
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-quarkus --network=host --rm $(id -un)/conference_service_quarkus:1.0.0

  __  ____  __  _____   ___  __ ____  ______ 
  --/ __ \/ / / / _ | / _ \/ //_/ / / / __/ 
  -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \   
  --\___\_\____/_/ |_/_/|_/_/|_|\____/___/   
  2023-09-21 07:45:00,585 INFO  [io.quarkus] (main) conference_service_quarkus 1.0.0 native (powered by Quarkus 3.3.1) started in 0.073s. Listening on: http://0.0.0.0:8100
  2023-09-21 07:45:00,586 INFO  [io.quarkus] (main) Profile prod activated. 
  2023-09-21 07:45:00,586 INFO  [io.quarkus] (main) Installed features: [agroal, cdi, hibernate-orm, hibernate-validator, jdbc-mysql, narayana-jta, rest-client, rest-client-jackson, resteasy, resteasy-jackson, resteasy-jsonb, smallrye-context-propagation, smallrye-fault-tolerance, vertx]
  ```

- Test the service by sending the request using the `requests.http` file.

## Test performance

### Startup time

The startup time will be printed in the console when the service is started.

```console
2023-09-21 07:45:00,585 INFO  [io.quarkus] (main) conference_service_quarkus 1.0.0 native (powered by Quarkus 3.3.1) started in 0.073s. Listening on: http://0.0.0.0:8100
```

### Memory and CPU usage

Run the following command to get the CPU and memory usage of the application.

```console
$ ps aux | grep conference_service_quarkus | grep -v grep | awk '{$6="RSS:"($6/1024)"M";}{$3="CPU:"$3"%";}{print $3, $6;}'

CPU:0.0% RSS:70.4531M
```

### Throughput

- Install [`wrk`](https://github.com/wg/wrk)
- Run the following command to get the throughput

  ```console
  $ wrk -t5 -c100 -d3m http://localhost:8100/conferences

  Running 3m test @ http://localhost:8100/conferences
    5 threads and 100 connections
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency    44.34ms   33.00ms 522.54ms   55.77%
      Req/Sec   464.40     78.77   770.00     68.91%
    415997 requests in 3.00m, 28.56MB read
  Requests/sec:   2310.15
  Transfer/sec:    162.43KB
  ```
  
  > **Note:** This benchmark runs for 3 minutes with 5 threads and 100 connections.

### Latency

- Install [`wrk2`](https://github.com/giltene/wrk2)
- Run the following command to get the latency

  ```console
  $ wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8100/conferences

  Running 3m test @ http://localhost:8100/conferences
    5 threads and 100 connections
    Thread calibration: mean lat.: 8.278ms, rate sampling interval: 16ms
    Thread calibration: mean lat.: 7.663ms, rate sampling interval: 16ms
    Thread calibration: mean lat.: 9.625ms, rate sampling interval: 17ms
    Thread calibration: mean lat.: 9.249ms, rate sampling interval: 16ms
    Thread calibration: mean lat.: 8.791ms, rate sampling interval: 16ms
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency     5.91ms    2.21ms  78.59ms   92.72%
      Req/Sec   206.30     42.93   625.00     84.18%
    Latency Distribution (HdrHistogram - Recorded Latency)
  50.000%    5.46ms
  75.000%    6.12ms
  90.000%    7.20ms
  99.000%   15.39ms
  99.900%   25.07ms
  99.990%   58.88ms
  99.999%   75.84ms
  100.000%   78.66ms
  ```

  > **Note:** This benchmark runs for 3 minutes with 5 threads, 100 connections and 1000 requests per second.
