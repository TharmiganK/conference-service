import ballerina/http;

# Represents a Error Detail
# 
# + message - The message of the error
# + cause - The cause of the error
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

# Represents a Country
# 
# + name - The name of the country
public type Country record{|
    string name;
|};
