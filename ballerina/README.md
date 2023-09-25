# Conference Service - Ballerina version

This directory contains the Ballerina version of the Conference Service.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Build and Run the service locally](#build-and-run-the-service-locally)
- [Build and Run the service in a Docker container](#build-and-run-the-service-in-a-docker-container)
- [Test performance](#test-performance)

## Prerequisites

- Install [Ballerina 2201.8.0](https://ballerina.io/downloads/).
- Install [VSCode](https://code.visualstudio.com/) with the [REST Client extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).
- Install and Configure GraalVM. See the [Configure GraalVM](https://ballerina.io/learn/build-the-executable-locally/#configure-graalvm) section for more details.
- Install [Docker](https://docs.docker.com/get-docker/).
- Run the docker-compose file to start the `country-service` and the mysql database.

  ```console
  $ docker-compose up -d

  [+] Running 3/3
   ✔ Network ballerina_default  Created                   0.0s 
   ✔ Container conferencedb     Started                   0.6s 
   ✔ Container country-service  Started                   0.4s 
  ```

- Run the following command to generate database client code for the model defined in `persist` directory.

  ```console
  $ bal persist generate

  Persist client and entity types generated successfully in the ./generated directory.
  ```

## Build and Run the service locally

### JAR file

- Build the JAR file using the following command.

  ```console
  $ bal build

  Resolving Maven dependencies
        Downloading dependencies into /Users/tharmigan/conference-service/ballerina/target/platform-libs

  Compiling source
        tharmigan/conference_service_ballerina:0.1.0

  ballerinax/mysql.driver:1.5.0 pulled from central successfully
  ballerinax/persist.sql:1.2.0 pulled from central successfully
  ballerinax/mysql:1.11.0 pulled from central successfully

  Generating executable
        target/bin/conference_service_ballerina.jar
  ```

- Run the following command to execute the JAR file.

  ```console
  $ bal run target/bin/conference_service_ballerina.jar

  time=2023-09-20T12:39:11.101+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Starting the listener..."
  time=2023-09-20T12:39:11.160+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Startup completed. Listening on: http://localhost:8102"
  ```

- Test the service by sending the request using the `requests.http` file.

### GraalVM native executable

- Run the following command to build the native executable. The executable will be created in the `target/bin` directory.

  ```console
  $ bal build --graalvm

  Resolving Maven dependencies
        Downloading dependencies into /Users/tharmigan/conference-service/ballerina/target/platform-libs

  Compiling source
        tharmigan/conference_service_ballerina:0.1.0

  ballerinax/mysql.driver:1.5.0 pulled from central successfully
  ballerinax/persist.sql:1.2.0 pulled from central successfully
  ballerinax/mysql:1.11.0 pulled from central successfully

  ========================================================================================================================
  GraalVM Native Image: Generating 'conference_service_ballerina' (executable)...
  ========================================================================================================================
  [1/8] Initializing...                                                                                    (5.4s @ 0.29GB)
  Java version: 17.0.8+7, vendor version: GraalVM CE 17.0.8+7.1
  Graal compiler: optimization level: 2, target machine: armv8-a
  C compiler: cc (apple, arm64, 14.0.3)
  Garbage collector: Serial GC (max heap size: 80% of RAM)
  2 user-specific feature(s)
  - com.oracle.svm.thirdparty.gson.GsonFeature
  - io.ballerina.stdlib.crypto.svm.BouncyCastleFeature
  [2/8] Performing analysis...  [*******]                                                                 (44.1s @ 2.48GB)
    24,346 (92.54%) of 26,309 types reachable
    75,179 (79.30%) of 94,805 fields reachable
  116,162 (68.05%) of 170,703 methods reachable
    5,603 types,   159 fields, and 4,392 methods registered for reflection
        86 types,    78 fields, and    65 methods registered for JNI access
        5 native libraries: -framework CoreServices, -framework Foundation, dl, pthread, z
  [3/8] Building universe...                                                                               (9.0s @ 2.52GB)
  [4/8] Parsing methods...      [***]                                                                      (6.3s @ 1.64GB)
  [5/8] Inlining methods...     [***]                                                                      (2.6s @ 1.56GB)
  [6/8] Compiling methods...    [******]                                                                  (40.7s @ 3.01GB)
  [7/8] Layouting methods...    [***]                                                                      (6.1s @ 2.96GB)
  [8/8] Creating image...       [***]                                                                     (10.2s @ 2.34GB)
    82.33MB (56.69%) for code area:    78,437 compilation units
    61.33MB (42.23%) for image heap:  504,128 objects and 39 resources
    1.56MB ( 1.08%) for other data
  145.22MB in total
  ------------------------------------------------------------------------------------------------------------------------
  Top 10 origins of code area:                                Top 10 object types in image heap:
    58.90MB conference_service_ballerina.jar                    15.78MB byte[] for code metadata
    12.20MB java.base                                           13.29MB byte[] for embedded resources
    3.03MB java.xml                                             6.02MB java.lang.Class
    1.40MB java.desktop                                         4.95MB java.lang.String
    1.33MB svm.jar (Native Image)                               4.69MB byte[] for java.lang.String
    1.21MB java.net.http                                        3.93MB byte[] for general heap data
  610.59kB java.naming                                          2.04MB com.oracle.svm.core.hub.DynamicHubCompanion
  549.86kB java.security.jgss                                   1.26MB byte[] for reflection metadata
  511.75kB java.management                                      1.04MB java.lang.String[]
  458.45kB java.rmi                                           899.80kB c.o.svm.core.hub.DynamicHub$ReflectionMetadata
    1.74MB for 24 more packages                                 6.84MB for 4122 more object types
  ------------------------------------------------------------------------------------------------------------------------
  Recommendations:
  HEAP: Set max heap for improved and more predictable memory usage.
  CPU:  Enable more CPU features with '-march=native' for improved performance.
  ------------------------------------------------------------------------------------------------------------------------
                        18.3s (14.6% of total time) in 160 GCs | Peak RSS: 4.21GB | CPU load: 5.52
  ------------------------------------------------------------------------------------------------------------------------
  Produced artifacts:
  /Users/tharmigan/conference-service/ballerina/target/bin/conference_service_ballerina (executable)
  ========================================================================================================================
  Finished generating 'conference_service_ballerina' in 2m 5s.
  ```

- Run the executable directly.

  ```console
  $ ./target/bin/conference_service_ballerina

  time=2023-09-20T12:49:42.686+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Starting the listener..."
  time=2023-09-20T12:49:42.688+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Startup completed. Listening on: http://localhost:8102"
  ```

- Test the service by sending the request using the `requests.http` file.

## Build and Run the service in a Docker container

### Docker image containing the JAR file

- Run the following command to build a docker image containing the JAR file.

  ```console
  $ bal build --cloud=docker

  Resolving Maven dependencies
          Downloading dependencies into /Users/wso2/Documents/graalvm-comparison/conference-service/ballerina/target/platform-libs

  Compiling source
          tharmigan/conference_service_ballerina:0.1.0

  ballerinax/mysql.driver:1.5.0 pulled from central successfully
  ballerinax/persist.sql:1.2.0 pulled from central successfully
  ballerinax/mysql:1.11.0 pulled from central successfully        

  Generating executable

  Generating artifacts

  Building the docker image

  [+] Building 13.0s (91/91) FINISHED

  Execute the below command to run the generated Docker image: 
          docker run -d conference_service_ballerina:latest

          target/bin/conference_service_ballerina.jar
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-ballerina --network host --rm -v ./Config.toml:/home/ballerina/Config.toml conference_service_ballerina:latest

  time=2023-09-20T07:47:31.789Z level=INFO module=tharmigan/conference_service_ballerina message="Starting the listener..."
  time=2023-09-20T07:47:32.323Z level=INFO module=tharmigan/conference_service_ballerina message="Startup completed. Listening on: http://localhost:8102"
  ```

- Test the service by sending the request using the `requests.http` file.

### Docker image containing the GraalVM executable

- Run the following command to build a docker image containing the GraalVM executable.

  ```console
  $ bal build --cloud=docker --graalvm

  Resolving Maven dependencies
          Downloading dependencies into /Users/wso2/Documents/graalvm-comparison/conference-service/ballerina/target/platform-libs

  Compiling source
          tharmigan/conference_service_ballerina:0.1.0

  ballerinax/mysql.driver:1.5.0 pulled from central successfully
  ballerinax/persist.sql:1.2.0 pulled from central successfully
  ballerinax/mysql:1.11.0 pulled from central successfully        

  Generating executable

  Generating artifacts

  Building the docker image

  [+] Building 188.9s (13/13) FINISHED

  Execute the below command to run the generated Docker image: 
        docker run -d conference_service_ballerina:latest
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-ballerina --network host --rm -v ./Config.toml:/home/ballerina/Config.toml conference_service_ballerina:latest

  time=2023-09-20T08:13:04.087Z level=INFO module=tharmigan/conference_service_ballerina message="Starting the listener..."
  time=2023-09-20T08:13:04.091Z level=INFO module=tharmigan/conference_service_ballerina message="Startup completed. Listening on: http://localhost:8102"
  ```

- Test the service by sending the request using the `requests.http` file.

## Test performance

### Startup time

Run the following script to run the application with an initialization log. The startup time can be calculated from the difference of the timestamps of the first and the last log statements.

- Run the JAR file

  ```console
  $ echo "time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=\"Executing the Ballerina application\"" && bal run ./target/bin/conference_service_ballerina.jar

  time=2023-09-20T13:55:19.149+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Executing the Ballerina application"
  time=2023-09-20T13:55:19.834+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Starting the listener..."
  time=2023-09-20T13:55:19.891+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Startup completed. Listening on: http://localhost:8102"
  ```

- Run the GraalVM native executable

  ```console
  $ echo "time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=\"Executing the Ballerina application\"" && ./target/bin/conference_service_ballerina

  time=2023-09-20T13:54:02.134+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Executing the Ballerina application"
  time=2023-09-20T13:54:02.194+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Starting the listener..."
  time=2023-09-20T13:54:02.196+05:30 level=INFO module=tharmigan/conference_service_ballerina message="Startup completed. Listening on: http://localhost:8102"
  ```

### Memory and CPU usage

Run the following command to get the CPU and memory usage of the application.

```console
$ ps aux | grep conference_service_ballerina | grep -v grep | awk '{$6="RSS:"($6/1024)"M";}{$3="CPU:"$3"%";}{print $3, $6;}'

CPU:0.0% RSS:71.5938M  
```

### Throughput

- Install [`wrk`](https://github.com/wg/wrk)
- Run the following command to get the throughput

  ```console
  $ wrk -t5 -c100 -d3m http://localhost:8102/conferences

  Running 3m test @ http://localhost:8102/conferences
    5 threads and 100 connections
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency    12.63ms   19.37ms 554.15ms   97.27%
      Req/Sec     0.93k   437.01     2.52k    53.14%
    832036 requests in 3.00m, 103.15MB read
  Requests/sec:   4619.99
  Transfer/sec:    586.52KB
  ```
  
  > **Note:** This benchmark runs for 3 minutes with 5 threads and 100 connections.

### Latency

- Install [`wrk2`](https://github.com/giltene/wrk2)
- Run the following command to get the latency

  ```console
  $ wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8102/conferences

  Running 3m test @ http://localhost:8102/conferences
    5 threads and 100 connections
    Thread calibration: mean lat.: 2.687ms, rate sampling interval: 10ms
    Thread calibration: mean lat.: 2.687ms, rate sampling interval: 10ms
    Thread calibration: mean lat.: 2.705ms, rate sampling interval: 10ms
    Thread calibration: mean lat.: 2.704ms, rate sampling interval: 10ms
    Thread calibration: mean lat.: 2.444ms, rate sampling interval: 10ms
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency     2.85ms    1.66ms  55.42ms   94.00%
      Req/Sec   210.56     61.65     1.00k    71.80%
    Latency Distribution (HdrHistogram - Recorded Latency)
  50.000%    2.62ms
  75.000%    3.19ms
  90.000%    3.83ms
  99.000%    9.95ms
  99.900%   21.47ms
  99.990%   40.45ms
  99.999%   47.45ms
  100.000%   55.45ms
  ```

  > **Note:** This benchmark runs for 3 minutes with 5 threads, 100 connections and 1000 requests per second.
