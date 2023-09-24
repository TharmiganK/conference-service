# Conference Service - Spring Boot version

This directory contains the Spring Boot version of the Conference Service.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Build and Run the service locally](#build-and-run-the-service-locally)
- [Build and Run the service in a Docker container](#build-and-run-the-service-in-a-docker-container)
- [Test performance](#test-performance)

## Prerequisites

- Install [VSCode](https://code.visualstudio.com/) with the [REST Client extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).
- Install GraalVM.
- Install [Docker](https://docs.docker.com/get-docker/).
- Run the docker-compose file to start the `country-service` and the mysql database.

  ```console
  $ docker-compose up -d

  [+] Running 3/3
   ✔ Network spring-boot_default  Created                   0.0s 
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
  $ java -jar ./target/conference_service_springboot-1.0.0.jar

   .   ____          _            __ _ _
  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
  ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
   '  |____| .__|_| |_|_| |_\__, | / / / /
  =========|_|==============|___/=/_/_/_/
  :: Spring Boot ::                (v3.1.3)

  2023-09-21T14:04:15.314+05:30  INFO 28819 --- [           main] t.t.c.ConferenceServiceApplication       : Starting ConferenceServiceApplication v1.0.0 using Java 17.0.8 with PID 28819 (/Users/wso2/Documents/graalvm-comparison/conference-service/spring-boot/target/conference_service_springboot-1.0.0.jar started by wso2 in /Users/wso2/Documents/graalvm-comparison/conference-service/spring-boot)
  2023-09-21T14:04:15.316+05:30  INFO 28819 --- [           main] t.t.c.ConferenceServiceApplication       : No active profile set, falling back to 1 default profile: "default"
  2023-09-21T14:04:15.733+05:30  INFO 28819 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data JPA repositories in DEFAULT mode.
  2023-09-21T14:04:15.768+05:30  INFO 28819 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 30 ms. Found 1 JPA repository interfaces.
  2023-09-21T14:04:16.094+05:30  INFO 28819 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8103 (http)
  2023-09-21T14:04:16.100+05:30  INFO 28819 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
  2023-09-21T14:04:16.101+05:30  INFO 28819 --- [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.12]
  2023-09-21T14:04:16.151+05:30  INFO 28819 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
  2023-09-21T14:04:16.152+05:30  INFO 28819 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 802 ms
  2023-09-21T14:04:16.229+05:30  INFO 28819 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
  2023-09-21T14:04:16.461+05:30  INFO 28819 --- [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection com.mysql.cj.jdbc.ConnectionImpl@6a175569
  2023-09-21T14:04:16.462+05:30  INFO 28819 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
  2023-09-21T14:04:16.488+05:30  INFO 28819 --- [           main] o.hibernate.jpa.internal.util.LogHelper  : HHH000204: Processing PersistenceUnitInfo [name: default]
  2023-09-21T14:04:16.532+05:30  INFO 28819 --- [           main] org.hibernate.Version                    : HHH000412: Hibernate ORM core version 6.2.7.Final
  2023-09-21T14:04:16.534+05:30  INFO 28819 --- [           main] org.hibernate.cfg.Environment            : HHH000406: Using bytecode reflection optimizer
  2023-09-21T14:04:16.619+05:30  INFO 28819 --- [           main] o.h.b.i.BytecodeProviderInitiator        : HHH000021: Bytecode provider name : bytebuddy
  2023-09-21T14:04:16.711+05:30  INFO 28819 --- [           main] o.s.o.j.p.SpringPersistenceUnitInfo      : No LoadTimeWeaver setup: ignoring JPA class transformer
  2023-09-21T14:04:16.863+05:30  INFO 28819 --- [           main] o.h.b.i.BytecodeProviderInitiator        : HHH000021: Bytecode provider name : bytebuddy
  2023-09-21T14:04:17.189+05:30  INFO 28819 --- [           main] o.h.e.t.j.p.i.JtaPlatformInitiator       : HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
  2023-09-21T14:04:17.190+05:30  INFO 28819 --- [           main] j.LocalContainerEntityManagerFactoryBean : Initialized JPA EntityManagerFactory for persistence unit 'default'
  2023-09-21T14:04:17.380+05:30  WARN 28819 --- [           main] JpaBaseConfiguration$JpaWebConfiguration : spring.jpa.open-in-view is enabled by default. Therefore, database queries may be performed during view rendering. Explicitly configure spring.jpa.open-in-view to disable this warning
  2023-09-21T14:04:17.564+05:30  INFO 28819 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8103 (http) with context path ''
  2023-09-21T14:04:17.570+05:30  INFO 28819 --- [           main] t.t.c.ConferenceServiceApplication       : Started ConferenceServiceApplication in 2.485 seconds (process running for 2.768)
  ```

- Test the service by sending the request using the `requests.http` file.

### GraalVM native executable

- Run the following command to build the native executable. The executable will be created in the `target/bin` directory.

  ```console
  $ ./mvnw -Pnative native:compile
  ```

- Run the executable directly.

  ```console
  $ ./target/conference_service_springboot

   .   ____          _            __ _ _
  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
  ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
   '  |____| .__|_| |_|_| |_\__, | / / / /
  =========|_|==============|___/=/_/_/_/
  :: Spring Boot ::                (v3.1.3)

  2023-09-21T14:12:40.819+05:30  INFO 29430 --- [           main] t.t.c.ConferenceServiceApplication       : Starting AOT-processed ConferenceServiceApplication using Java 17.0.8 with PID 29430 (/Users/wso2/Documents/graalvm-comparison/conference-service/spring-boot/target/conference_service_springboot started by wso2 in /Users/wso2/Documents/graalvm-comparison/conference-service/spring-boot)
  2023-09-21T14:12:40.819+05:30  INFO 29430 --- [           main] t.t.c.ConferenceServiceApplication       : No active profile set, falling back to 1 default profile: "default"
  2023-09-21T14:12:40.838+05:30  INFO 29430 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8103 (http)
  2023-09-21T14:12:40.839+05:30  INFO 29430 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
  2023-09-21T14:12:40.839+05:30  INFO 29430 --- [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.12]
  2023-09-21T14:12:40.845+05:30  INFO 29430 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
  2023-09-21T14:12:40.845+05:30  INFO 29430 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 26 ms
  2023-09-21T14:12:40.856+05:30  INFO 29430 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
  2023-09-21T14:12:40.891+05:30  INFO 29430 --- [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection com.mysql.cj.jdbc.ConnectionImpl@74d18f95
  2023-09-21T14:12:40.891+05:30  INFO 29430 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
  2023-09-21T14:12:40.892+05:30  INFO 29430 --- [           main] o.hibernate.jpa.internal.util.LogHelper  : HHH000204: Processing PersistenceUnitInfo [name: default]
  2023-09-21T14:12:40.893+05:30  INFO 29430 --- [           main] org.hibernate.Version                    : HHH000412: Hibernate ORM core version 6.2.7.Final
  2023-09-21T14:12:40.894+05:30  WARN 29430 --- [           main] org.hibernate.orm.deprecation            : HHH90000029: The [hibernate.bytecode.use_reflection_optimizer] configuration is deprecated and will be removed. Set the value to [true] to get rid of this warning
  2023-09-21T14:12:40.911+05:30  INFO 29430 --- [           main] o.h.b.i.BytecodeProviderInitiator        : HHH000021: Bytecode provider name : none
  2023-09-21T14:12:40.920+05:30  INFO 29430 --- [           main] o.h.e.t.j.p.i.JtaPlatformInitiator       : HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
  2023-09-21T14:12:40.920+05:30  INFO 29430 --- [           main] j.LocalContainerEntityManagerFactoryBean : Initialized JPA EntityManagerFactory for persistence unit 'default'
  2023-09-21T14:12:40.951+05:30  WARN 29430 --- [           main] JpaBaseConfiguration$JpaWebConfiguration : spring.jpa.open-in-view is enabled by default. Therefore, database queries may be performed during view rendering. Explicitly configure spring.jpa.open-in-view to disable this warning
  2023-09-21T14:12:40.967+05:30  INFO 29430 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8103 (http) with context path ''
  2023-09-21T14:12:40.967+05:30  INFO 29430 --- [           main] t.t.c.ConferenceServiceApplication       : Started ConferenceServiceApplication in 0.164 seconds (process running for 0.179)
  ```

- Test the service by sending the request using the `requests.http` file.

## Build and Run the service in a Docker container

### Docker image containing the JAR file

- Run the following command to build a docker image containing the JAR file.

  ```console
  $ ./mvnw spring-boot:build-image
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-springboot --network=host --rm conference_service_springboot:1.0.0
  ```

- Test the service by sending the request using the `requests.http` file.

### Docker image containing the GraalVM executable

- Run the following command to build a docker image containing the GraalVM executable.

  ```console
  $ ./mvnw spring-boot:build-image -Pnative
  ```

- Run the Docker image.

  ```console
  $ docker run --name conference-service-springboot --network=host --rm conference_service_springboot:1.0.0
  ```

- Test the service by sending the request using the `requests.http` file.

## Test performance

### Startup time

The startup time will be printed in the console when the service is started.

```console
2023-09-21T14:12:40.967+05:30  INFO 29430 --- [           main] t.t.c.ConferenceServiceApplication       : Started ConferenceServiceApplication in 0.164 seconds (process running for 0.179)
```

### Memory and CPU usage

Run the following command to get the CPU and memory usage of the application.

```console
$ ps aux | grep conference_service_springboot | grep -v grep | awk '{$6="RSS:"($6/1024)"M";}{$3="CPU:"$3"%";}{print $3, $6;}'

CPU:0.0% RSS:137.547M
```

### Throughput

- Install [`wrk`](https://github.com/wg/wrk)
- Run the following command to get the throughput

  ```console
  $ wrk -t5 -c100 -d3m http://localhost:8103/conferences

  Running 3m test @ http://localhost:8103/conferences
    5 threads and 100 connections
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency   242.32ms   78.28ms 959.62ms   73.77%
      Req/Sec    83.08     34.07   210.00     66.12%
    74426 requests in 3.00m, 14.56MB read
  Requests/sec:    413.32
  Transfer/sec:     82.82KB
  ```
  
  > **Note:** This benchmark runs for 3 minutes with 5 threads and 100 connections.

### Latency

- Install [`wrk2`](https://github.com/giltene/wrk2)
- Run the following command to get the latency

  ```console
  $ wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8103/conferences

    5 threads and 100 connections
    Thread calibration: mean lat.: 3200.128ms, rate sampling interval: 11091ms
    Thread calibration: mean lat.: 3180.218ms, rate sampling interval: 11018ms
    Thread calibration: mean lat.: 3176.962ms, rate sampling interval: 11091ms
    Thread calibration: mean lat.: 3206.989ms, rate sampling interval: 11108ms
    Thread calibration: mean lat.: 3207.701ms, rate sampling interval: 11149ms
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency     0.94m    28.86s    1.76m    57.42%
      Req/Sec    82.97      4.66    92.00     82.67%
    Latency Distribution (HdrHistogram - Recorded Latency)
  50.000%    0.96m 
  75.000%    1.36m 
  90.000%    1.60m 
  99.000%    1.73m 
  99.900%    1.75m 
  99.990%    1.76m 
  99.999%    1.76m 
  100.000%    1.76m 
  ```

  > **Note:** This benchmark runs for 3 minutes with 5 threads, 100 connections and 1000 requests per second.
