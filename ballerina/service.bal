import conference_service_ballerina.db as db;

import ballerina/http;
import ballerina/mime;
import ballerina/persist;

configurable string countryServiceUrl = "http://localhost:9000";
final http:Client countryServiceClient = check new (countryServiceUrl);

final db:Client conferenceDBClient = check new;

service class ConferenceService {
    *http:Service;

    function init() returns error? {
        _ = check conferenceDBClient->executeNativeSQL(`DELETE FROM Conference`);
    }

    @http:ResourceConfig {
        produces: [mime:APPLICATION_JSON]
    }
    isolated resource function get conferences() returns db:Conference[]|ConferenceServerError {

        do {
            stream<db:Conference, persist:Error?> conferenceStream = conferenceDBClient->/conferences;
            return check from db:Conference conference in conferenceStream
                select conference;
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
    isolated resource function post conferences(db:ConferenceInsert conference) returns ConferenceServerError? {

        do {
            _ = check conferenceDBClient->/conferences.post([conference]);
            return;
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
            stream<db:Conference, persist:Error?> conferenceStream = conferenceDBClient->/conferences;
            return check from db:Conference conference in conferenceStream
                select {
                    name: conference.name,
                    country: check self.getCountry(conference.name)
                };
        } on fail error err {
            return {
                body: {
                    message: "Error occurred while retrieving conferences with country",
                    cause: err.message()
                }
            };
        }
    }

    isolated function getCountry(string conference) returns string|error {
        CountryResponse countryResp = check countryServiceClient->/conferences/[conference]/country;
        return countryResp.name;
    }
}
