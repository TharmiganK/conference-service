import ballerina/log;
import ballerina/http;
import ballerina/lang.runtime;

configurable int conferenceServicePort = ?;
listener http:Listener conferenceListener = check new (conferenceServicePort);

public function main() returns error? {
    log:printInfo("Starting the listener...");
    // Attach the service to the listener.
    check conferenceListener.attach(check new ConferenceService());
    // Start the listener.
    check conferenceListener.'start();
    // Register the listener dynamically.
    runtime:registerListener(conferenceListener);
    log:printInfo(string `Startup completed. Listening on: http://localhost:${conferenceServicePort}`);
}
