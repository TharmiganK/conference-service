import ballerinax/java.jdbc;
// TODO : Replace this with `ballerinax/h2.driver` once the package is released
import ballerina/sql;
import ballerina/http;
import tharmigank/h2.driver as _;

# Represents the configuration of the h2 database
#
# + user - The user of the database  
# + password - The password of the database  
# + dbName - The file path of the database
public type H2dbConfigs record {|
    string user;
    string password;
    string dbName;
|};

# Represents a country
# 
# + name - The name of the country
public type Country record {|
    string name;
|};

public isolated client class ConferenceDBClient {

    private final jdbc:Client conferenceJDBCClient;
    private final http:Client countryClient;

    public isolated function init(H2dbConfigs dbConfigs, string countryServiceUrl) returns error? {
        self.conferenceJDBCClient = check new ("jdbc:h2:mem:" + dbConfigs.dbName, dbConfigs.user, dbConfigs.password);
        self.countryClient = check new (countryServiceUrl,
            retryConfig = {
                count: 3,
                interval: 2
            },
            // TODO : Check the requirement for this as it is used in quarkus and micronaut samples
            circuitBreaker = {}
        );

        check self.dropTable();
        check self.createTable();
    }

    isolated function createTable() returns error? {
        _ = check self.conferenceJDBCClient->execute(`CREATE TABLE conferences (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255))`);
    }

    isolated function dropTable() returns error? {
        _ = check self.conferenceJDBCClient->execute(`DROP TABLE IF EXISTS conferences`);
    }

    isolated resource function get conferences() returns Conference[]|error {
        stream<Conference, sql:Error?> conferenceStream = self.conferenceJDBCClient->query(`SELECT * FROM conferences`);
        return from Conference conference in conferenceStream
            select conference;
    }

    isolated resource function post conferences(ConferenceRequest conference) returns error? {
        _ = check self.conferenceJDBCClient->execute(`INSERT INTO conferences (name) VALUES (${conference.name})`);
    }

    isolated resource function get conferenceswithcountry() returns ExtendedConference[]|error {
        Conference[] conferences = check self->/conferences;
        return from Conference conference in conferences
            select {
                name: conference.name,
                country: check self.getCountry(conference.name)
            };
    }

    isolated function getCountry(string conference) returns string|error {
        Country country = check self.countryClient->/conferences/[conference]/country;
        return country.name;
    }
}
