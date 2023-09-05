# Conference Service - Ballerina version

This directory contains the Ballerina version of the Conference Service.

## Prerequisite for testing

- Run the mock `country-service`:
    - **Option 1:** Run the following command inside the `mock-country-service-ballerina` directory.

        ```bash
        bal run
        ```
    - **Option 2:** Run the following Docker image.

        ```bash
        docker run --network host --rm ktharmi176/country-service:latest
        ```

## Table of Contents

- [Running the service locally using the JAR file](#running-the-service-locally-using-the-jar-file)
- [Running the service locally using the GraalVM executable](#running-the-service-locally-using-the-graalvm-executable)
- [Running the service in a Docker container with the JAR file](#running-the-service-in-a-docker-container-with-the-jar-file)
- [Running the service in a Docker container with the GraalVM executable](#running-the-service-in-a-docker-container-with-the-graalvm-executable)


## Running the service locally using the JAR file

### Prerequisites

- Install [Ballerina 2201.8.0](https://ballerina.io/downloads/).
- Install [VSCode](https://code.visualstudio.com/) with the [REST Client extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).

### Building the JAR file

- **Option 1:** Run the following `bal` command.

    ```bash
    bal build
    ```

- **Option 2:** Run the script file(which runs the same command as above).
    
    ```bash
    sh build.sh
    ```

### Running the service

- **Option 1:** Run the following `bal` command.

    ```bash
    bal run target/bin/conference_service_ballerina.jar
    ```

- **Option 2:** Run the script file(which runs the same command as above. In addition it will print a log before running the JAR file).
    
    ```bash
    sh run.sh
    ```

### Testing the service

> **Note:** Make sure the [`country-service` is up and running](#prerequisite-for-testing) before testing the service.

- **Option 1:** Manually test the service by sending the request using the `requests.http` file.

- **Option 2:** Run the script file. This will make several requests to the endpoint and will print the response code, and the response time. In addition, this will print the RSS and the CPU usage of the service.

    ```bash
    sh test.sh
    ```

## Running the service locally using the GraalVM executable

### Prerequisites

- Install [Ballerina 2201.8.0](https://ballerina.io/downloads/). Make sure you install Ballerina using the installer compatible with your OS.
- Install [VSCode](https://code.visualstudio.com/) with the [REST Client extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).
- Install and Configure GraalVM. See the [Configure GraalVM](https://ballerina.io/learn/build-the-executable-locally/#configure-graalvm) section for more details.

### Building the GraalVM executable

- **Option 1:** Run the following `bal` command.

    ```bash
    ballerina build --graalvm
    ```

- **Option 2:** Run the script file(which runs the same command as above).
    
    ```bash
    sh build.sh graalvm
    ```

- **Option 3:** Build the JAR file and run the following code.

    ```bash
    native-image -jar target/bin/conference_service_ballerina.jar --no-fallback
    ```

### Running the service

- **Option 1:** Run the executable directly.

    ```bash
    ./target/bin/conference_service_ballerina
    ```

- **Option 2:** Run the script file(which runs the same command as above. In addition it will print a log before running the executable).
    
    ```bash
    sh run.sh graalvm
    ```

### Testing the service

> **Note:** Make sure the [`country-service` is up and running](#prerequisite-for-testing) before testing the service.

- **Option 1:** Manually test the service by sending the request using the `requests.http` file.

- **Option 2:** Run the script file. This will make several requests to the endpoint and will print the response code, and the response time. In addition, this will print the RSS and the CPU usage of the service.

    ```bash
    sh test.sh
    ```

## Running the service in a Docker container with the JAR file

### Prerequisites

- Install [Ballerina 2201.8.0](https://ballerina.io/downloads/).
- Install [VSCode](https://code.visualstudio.com/) with the [REST Client extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).
- Install [Docker](https://docs.docker.com/get-docker/).
- Increase the memory limit of Docker.

### Building the Docker image

- **Option 1:** Run the following `bal` command.

    ```bash
    bal build --cloud=docker
    ```

- **Option 2:** Run the script file(which runs the same command as above).
    
    ```bash
    sh docker-build.sh
    ```

- **Option 3:** Build the JAR file and manually build the Docker image using the Dockerfile(which packs the uber JAR and will print a log before running the JAR file).

    ```bash
    docker build -f Dockerfile-jar -t conference-service-ballerina:latest .
    ```

### Running the service

- **Option 1:** Run the Docker image manually.

    ```bash
    docker run --name conference-service-ballerina --network host --rm conference-service-ballerina:latest
    ```

- **Option 2:** Run the script file(which runs the same command as above).
    
    ```bash
    sh docker-run.sh
    ```

- **Option 3:** Run the pre-build Docker image from the Docker Hub.

    ```bash
    docker run --name conference-service-ballerina --network host --rm ktharmi176/conference-service-ballerina:2201.8.0-jar
    ```
### Testing the service

> **Note:** Make sure the [`country-service` is up and running](#prerequisite-for-testing) before testing the service.

- **Option 1:** Manually test the service by sending the request using the `requests.http` file.

- **Option 2:** Run the script file. This will make several requests to the endpoint and will print the response code, and the response time. In addition, this will print the RSS and the CPU usage of the service and stop the containers after testing.

    ```bash
    sh docker-test.sh
    ```

## Running the service in a Docker container with the GraalVM executable

### Prerequisites

- Install [Ballerina 2201.8.0](https://ballerina.io/downloads/). Make sure you install Ballerina using the installer compatible with your OS.
- Install [VSCode](https://code.visualstudio.com/) with the [REST Client extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).
- Install [Docker](https://docs.docker.com/get-docker/).
- Increase the memory limit of Docker.

### Building the Docker image

- **Option 1:** Run the following `bal` command.

    ```bash
    bal build --cloud=docker --graalvm
    ```

- **Option 2:** Run the script file(which runs the same command as above).
    
    ```bash
    sh docker-build.sh graalvm
    ```

- **Option 3:** Build the JAR file and manually build the Docker image using the Dockerfile(which packs the Mostly Static GraalVM executable).

    ```bash
    docker build -f Dockerfile-graalvm -t conference-service-ballerina:latest .
    ```
### Running the service

- **Option 1:** Run the Docker image manually.

    ```bash
    docker run --name conference-service-ballerina --network host --rm conference-service-ballerina:latest
    ```

- **Option 2:** Run the script file(which runs the same command as above).
    
    ```bash
    sh docker-run.sh
    ```

- **Option 3:** Run the pre-build Docker image from the Docker Hub.

    ```bash
    docker run --name conference-service-ballerina --network host --rm ktharmi176/conference-service-ballerina:2201.8.0-graalvm
    ```

### Testing the service

> **Note:** Make sure the [`country-service` is up and running](#prerequisite-for-testing) before testing the service.

- **Option 1:** Manually test the service by sending the request using the `requests.http` file.

- **Option 2:** Run the script file. This will make several requests to the endpoint and will print the response code, and the response time. In addition, this will print the RSS and the CPU usage of the service and stop the containers after testing.

    ```bash
    sh docker-test.sh
    ```
