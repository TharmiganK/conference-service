# Represents a extended conference
#
# + name - The name of the conference
# + country - The country of the conference
public type ExtendedConference record {|
    string name;
    string country;
|};

# Represents a conference country Response
#
# + name - The name of the country
public type CountryResponse record {|
    string name;
|};
