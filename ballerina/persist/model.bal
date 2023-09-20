import ballerina/persist as _;

# Represents a conference
#
# + id - The id of the conference
# + name - The name of the conference
public type Conference record {|
    readonly string id;
    string name;
|};
