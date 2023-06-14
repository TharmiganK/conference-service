import ballerina/http;

configurable int countryServicePort = ?;

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

service on countryServiceEP {

    isolated resource function get conferences/[string name]/country() returns Country|ConferenceNotFound {

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
