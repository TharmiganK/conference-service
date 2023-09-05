import ballerina/log;
import ballerina/lang.runtime;
import ballerina/http;

configurable int countryServicePort = 9000;

final readonly & map<string> conferences = {
    "WSO2Con": "Sri Lanka",
    "QCon": "USA",
    "Strata": "UK",
    "Google I/O": "USA",
    "MS Build": "USA",
    "Apple WWDC": "USA",
    "Oracle OpenWorld": "USA",
    "AWS re:Invent": "USA",
    "KubeCon": "USA",
    "DockerCon": "USA",
    "Red Hat Summit": "USA",
    "IBM Think": "USA",
    "Google Cloud Next": "USA",
    "Microsoft Ignite": "USA"
};

listener http:Listener countryServiceEP = check new(countryServicePort);

service class CountryService {
    *http:Service;

    isolated resource function get [string name]/country() returns Country|ConferenceNotFound {

        string? countryName = conferences[name];
        if countryName is string {
            return { name: countryName };
        } else {
            return {
                body: {
                message: "Error ocurred while retrieving the country for the conference: " + name,
                cause: "No conference found with the name: " + name
            }
            };
        }
    }
}

public function main() returns error? {
    log:printInfo("Starting the listener...");
    // Attach the service to the listener.
    check countryServiceEP.attach(new CountryService(), "conferences");
    // Start the listener.
    check countryServiceEP.'start();
    // Register the listener dynamically.
    runtime:registerListener(countryServiceEP);
    log:printInfo(string `Startup completed. Listening on: http://localhost:${countryServicePort}`);
}
