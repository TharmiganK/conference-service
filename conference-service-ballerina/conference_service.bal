import ballerina/http;
import ballerina/mime;
import ballerina/sql;
import ballerinax/java.jdbc;
// TODO : Replace this with `ballerinax/h2.driver` once the package is released
import ballerina/lang.runtime;
import ballerina/log;
import tharmigank/h2.driver as _;

// Conference service
configurable int conferenceServicePort = ?;
listener http:Listener conferenceListener = check new (conferenceServicePort);

// Country client
configurable string countryServiceUrl = ?;
final http:Client countryClient = check new (countryServiceUrl,
    retryConfig = {
        count: 3,
        interval: 2
    },
    // TODO : Check the requirement for this as it is used in quarkus and micronaut samples
    circuitBreaker = {}
);

configurable h2dbConfigs dbConfigs = ?;
final jdbc:Client conferenceDbClient = check new ("jdbc:h2:file:" + dbConfigs.dbFilePath, dbConfigs.user, dbConfigs.password);

service class ConferenceService {
    *http:Service;

    @http:ResourceConfig {
        produces: [mime:APPLICATION_JSON]
    }
    isolated resource function get conferences() returns Conference[]|ConferenceServerError {

        do {
            return check getAllConferences();
        } on fail error err {
            return {
                body: {
                    message: "Error occurred while retrieving conferences",
                    cause: err.message()
                }
            };
        }
    }

    @http:ResourceConfig {
        consumes: [mime:APPLICATION_JSON]
    }
    isolated resource function post conferences(ConferenceRequest conference) returns ConferenceServerError? {

        do {
            return check createConference(conference);
        } on fail error err {
            return {
                body: {
                    message: "Error occurred while creating conference",
                    cause: err.message()
                }
            };
        }
    }

    @http:ResourceConfig {
        produces: [mime:APPLICATION_JSON]
    }
    isolated resource function get conferenceswithcountry() returns ExtendedConference[]|ConferenceServerError {

        do {
            return check getAllConferencesWithCountry();
        } on fail error err {
            return {
                body: {
                    message: "Error occurred while retrieving conferences with country",
                    cause: err.message()
                }
            };
        }
    }
}

isolated function getAllConferences() returns Conference[]|error {

    stream<Conference, sql:Error?> conferenceStream = conferenceDbClient->query(`SELECT * FROM conferences`);
    return from Conference conference in conferenceStream
        select conference;
}

isolated function createConference(ConferenceRequest conference) returns error? {

    _ = check conferenceDbClient->execute(`INSERT INTO conferences (name) VALUES (${conference.name})`);
}

isolated function getAllConferencesWithCountry() returns ExtendedConference[]|error {

    Conference[] conferences = check getAllConferences();
    return from Conference conference in conferences
        select {
            ...conference,
            country: check getCountry(conference.name)
        };
}

isolated function getCountry(string conferenceName) returns string|error {

    return check countryClient->/conferences/[conferenceName]/country;
}

public function main() returns error? {
    log:printInfo("Starting the listener...");
    // Attach the service to the listener.
    check conferenceListener.attach(new ConferenceService());
    // Start the listener.
    check conferenceListener.'start();
    // Register the listener dynamically.
    runtime:registerListener(conferenceListener);
    log:printInfo(string `Startup completed. Listening on: http://locahost:${conferenceServicePort}`);
}
