import os
import subprocess
import time
import logging

# Set up logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s: %(message)s"
)

# List of directories
directories = [
    "ballerina",
    "micronaut",
    "quarkus",
    "spring-boot"
]

# Loop through each directory
for directory in directories:
    logging.info(f"Entering directory: {directory}")

    # Step 1: Go inside the directory
    os.chdir("..")
    os.chdir(directory + "/.scripts")

    # Step 2: Run clean.sh
    logging.info(f"Running 'sh clean.sh' in {directory}")
    subprocess.run("sh clean.sh", shell=True, check=True)

    # Step 3: Run build.sh
    logging.info(f"Running JVM build in {directory}")
    subprocess.run("sh build.sh", shell=True, check=True)

    # Run Docker compose up
    logging.info(f"Running Docker compose up in {directory}")
    subprocess.run("docker-compose up -d", shell=True, check=True)

    # Wait for 30 seconds
    time.sleep(30)

    # Step 3: Run the test loop
    for i in range(9):
        # Run run.sh
        logging.info(f"Running JAR in {directory} (Iteration {i+1}/10)")
        subprocess.Popen(["sh", "run.sh"])

        # Wait for 10 seconds
        time.sleep(10)

        # Run test.sh stop
        logging.info(f"Running tests on JAR in {directory} (Iteration {i+1}/10)")
        subprocess.run("sh test.sh stop", shell=True, check=True)

        # Wait for 20 seconds
        time.sleep(20)

    # Step 4: Run the final test

    # Run run.sh
    logging.info(f"Running JAR in {directory} (Iteration 10/10)")
    subprocess.Popen(["sh", "run.sh"])

    # Wait for 10 seconds
    time.sleep(10)

    # Run psrecord.sh
    logging.info(f"Running ps record for JAR in {directory}")
    subprocess.Popen(["sh", "psrecord.sh"])

    # Run test.sh
    logging.info(f"Running tests with JAR in {directory}")
    subprocess.run("sh test.sh", shell=True, check=True)

    # Run perf.sh
    logging.info(f"Running throughput/latency tests with JAR in {directory}")
    subprocess.run("sh perf.sh", shell=True, check=True)

    # Step 3: Run build.sh
    logging.info(f"Running GraalVM build in {directory}")
    subprocess.run("sh build.sh graalvm", shell=True, check=True)

    # Step 3: Run the test loop
    for i in range(9):
        # Run run.sh
        logging.info(f"Running GraalVM native executable in {directory} (Iteration {i+1}/10)")
        subprocess.Popen(["sh", "run.sh", "graalvm"])

        # Wait for 10 seconds
        time.sleep(10)

        # Run test.sh stop
        logging.info(f"Running tests with native executable in {directory} (Iteration {i+1}/10)")
        subprocess.run("sh test.sh stop graalvm", shell=True, check=True)

        # Wait for 20 seconds
        time.sleep(20)

    # Step 4: Run the final test

    # Run run.sh
    logging.info(f"Running GraalVM native executable in {directory} (Iteration 10/10)")
    subprocess.Popen(["sh", "run.sh", "graalvm"])

    # Wait for 10 seconds
    time.sleep(10)

    # Run psrecord.sh
    logging.info(f"Running ps record with GraalVM native executable in {directory}")
    subprocess.Popen(["sh", "psrecord.sh", "graalvm"])

    # Run test.sh
    logging.info(f"Running tests with native executable in {directory}")
    subprocess.run("sh test.sh graalvm", shell=True, check=True)

    # Run perf.sh
    logging.info(f"Running throughput/latency tests with native executable in {directory}")
    subprocess.run("sh perf.sh graalvm", shell=True, check=True)

    # Run Docker compose down
    logging.info(f"Running Docker compose down in {directory}")
    subprocess.run("docker-compose down", shell=True, check=True)

    # Wait for 20 seconds
    time.sleep(20)

    logging.info(f"Exiting directory: {directory}")
    os.chdir("..")

logging.info("Script execution complete")
