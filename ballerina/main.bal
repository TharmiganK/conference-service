import ballerina/http;
import ballerina/lang.runtime;
import ballerina/log;

configurable int conferenceServicePort = 8102;

public function main() returns error? {
    http:Listener conferenceListener = check new (conferenceServicePort, timeout = 0);
    log:printInfo("Starting the listener...");
    // Attach the service to the listener.
    check conferenceListener.attach(new ConferenceService());
    // Start the listener.
    check conferenceListener.'start();
    // Register the listener dynamically.
    runtime:registerListener(conferenceListener);
    log:printInfo(string `Startup completed. Listening on: http://localhost:${conferenceServicePort}`);
}
