import ballerina/http;

public type ErrorDetail record {|
    string message;
    string cause;
|};

# Represents a Not Found Error Response
# 
# + body - The body of the response
public type ConferenceNotFound record {|
    *http:NotFound;
    ErrorDetail body;
|};
