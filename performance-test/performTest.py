import os
import subprocess
import time
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s: %(message)s')

# Create a file handler to log to a file
file_handler = logging.FileHandler('script.log')
file_handler.setLevel(logging.INFO)
file_handler.setFormatter(logging.Formatter('%(asctime)s - %(levelname)s: %(message)s'))
logging.getLogger().addHandler(file_handler)

# List of directories
directories = [
    "conference-service-ballerina",
    "conference-service-quarkus",
    "conference-service-micronaut",
    "conference-service-springboot",
]

# Loop through each directory
for directory in directories:
    logging.info(f"Entering directory: {directory}")
    
    # Step 1: Go inside the directory
    os.chdir("..")
    os.chdir(directory)

    # Step 2: Run clean.sh
    # logging.info(f"Running 'sh clean.sh' in {directory}")
    # subprocess.run("sh clean.sh", shell=True, check=True)

    # Step 3: Run build.sh
    logging.info(f"Running 'sh build.sh' in {directory}")
    subprocess.run("sh build.sh graalvm", shell=True, check=True)

    # Step 3: Run the test loop
    for i in range(9):
        # Run run.sh
        logging.info(f"Running 'sh run.sh' in {directory} (Iteration {i+1}/9)")
        subprocess.Popen(["sh", "run.sh", "graalvm"])

        # Wait for 5 seconds
        time.sleep(5)

        # Run test.sh stop
        logging.info(f"Running 'sh test.sh stop' in {directory} (Iteration {i+1}/9)")
        subprocess.run("sh test.sh stop graalvm", shell=True, check=True)

    # Step 4: Run the final test
    # Run run.sh
    logging.info(f"Running 'sh run.sh' in {directory} (Iteration 10/10)")
    subprocess.Popen(["sh", "run.sh", "graalvm"])

    # Wait for 5 seconds
    time.sleep(5)

    # Run psrecord.sh
    logging.info(f"Running 'sh psrecord.sh' in {directory}")
    subprocess.Popen(["sh", "psrecord.sh", "graalvm"])

    # Run test.sh
    logging.info(f"Running 'sh test.sh' in {directory}")
    subprocess.run("sh test.sh graalvm", shell=True, check=True)

    # Run perf.sh
    logging.info(f"Running 'sh perf.sh' in {directory}")
    subprocess.run("sh perf.sh graalvm", shell=True, check=True)
    
    logging.info(f"Exiting directory: {directory}")

logging.info("Script execution complete")
