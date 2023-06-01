// This represents a mock country client which should be run separately

// import ballerina/http;

// configurable int countryServicePort = ?;

// final readonly & map<string> conferences = {
//     "WSO2Con": "Sri Lanka",
//     "QCon": "USA",
//     "Strata": "UK",
//     "Google I/O": "USA",
//     "MS Build": "USA",
//     "Apple WWDC": "USA",
//     "Oracle OpenWorld": "USA",
//     "AWS re:Invent": "USA",
//     "KubeCon": "USA",
//     "DockerCon": "USA",
//     "Red Hat Summit": "USA",
//     "IBM Think": "USA",
//     "Google Cloud Next": "USA",
//     "Microsoft Ignite": "USA"
// };

// service on new http:Listener(countryServicePort) {

//     isolated resource function get conferences/[string name]/country() returns string|ConferenceNotFound {

//         return conferences[name] ?: {
//             body: {
//                 message: "Error ocurred while retrieving the country for the conference: " + name,
//                 cause: "No conference found with the name: " + name
//             }
//         };
//     }
// }
