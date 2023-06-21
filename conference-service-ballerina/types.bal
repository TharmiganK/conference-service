import ballerina/http;
import ballerina/constraint;


# Represents the configuration of the h2 database
#
# + user - The user of the database  
# + password - The password of the database  
# + dbName - The file path of the database
public type h2dbConfigs record {|
    string user;
    string password;
    string dbName;
|};

# Represents a conference
# 
# + id - The id of the conference
# + name - The name of the conference
public type Conference record{|
    readonly int id;
    string name;
|};

# Represents a conference request
# 
# + name - The name of the conference
public type ConferenceRequest record{|
    string name;
|};

# Represents a extended conference
# 
# + name - The name of the conference
# + country - The country of the conference
public type ExtendedConference record{|
    string name;
    string country;
|};

# Represents a conference configuration
# 
# + helloMessage - The hello message
public type ConferenceConfiguration record{|
    @constraint:String {
        minLength: 5
    }
    string helloMessage;
|};

# Represents a country
# 
# + name - The name of the country
public type Country record {|
    string name;
|};

# Represents a Error Detail
# 
# + message - The message of the error
# + cause - The cause of the error
public type ErrorDetail record {|
    string message;
    string cause;
|};

# Represents a Internal Server Error Response
# 
# + body - The body of the response
public type ConferenceServerError record {|
    *http:InternalServerError;
    ErrorDetail body;
|};
