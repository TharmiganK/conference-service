// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

public type Conference record {|
    readonly string id;
    string name;
|};

public type ConferenceOptionalized record {|
    string id?;
    string name?;
|};

public type ConferenceTargetType typedesc<ConferenceOptionalized>;

public type ConferenceInsert Conference;

public type ConferenceUpdate record {|
    string name?;
|};

