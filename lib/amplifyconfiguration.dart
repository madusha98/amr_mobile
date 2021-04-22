// Prod

// const amplifyconfig = ''' {
//     "UserAgent": "aws-amplify-cli/2.0",
//     "Version": "1.0",
//     "auth": {
//         "plugins": {
//             "awsCognitoAuthPlugin": {
//                 "UserAgent": "aws-amplify-cli/0.1.0",
//                 "Version": "0.1.0",
//                 "IdentityManager": {
//                     "Default": {}
//                 },
//                 "CredentialsProvider": {
//                   "CognitoIdentity": {
//                       "Default": {
//                           "PoolId": "ap-southeast-1:6c00014e-1006-462c-9a71-e71ad4c0993a",
//                           "Region": "ap-southeast-1"
//                       }
//                   }
//               },
//                 "CognitoUserPool": {
//                     "Default": {
//                         "PoolId": "ap-southeast-1_zIKlP1scD",
//                         "AppClientId": "6rvgnvliqg4ulr277gsc9feml5",
//                         "AppClientSecret": "",
//                         "Region": "ap-southeast-1"
//                     }
//                 },
//                 "Auth": {
//                     "Default": {
//                         "authenticationFlowType": "USER_SRP_AUTH"
//                     }
//                 }
//             }
//         }
//     }
// }''';

// Dev

// const amplifyconfig = ''' {
//     "UserAgent": "aws-amplify-cli/2.0",
//     "Version": "1.0",
//     "auth": {
//         "plugins": {
//             "awsCognitoAuthPlugin": {
//                 "UserAgent": "aws-amplify-cli/0.1.0",
//                 "Version": "0.1.0",
//                 "IdentityManager": {
//                     "Default": {}
//                 },
//                 "CredentialsProvider": {
//                   "CognitoIdentity": {
//                       "Default": {
//                           "PoolId": "ap-southeast-1:14c55b99-16a7-43d6-8d48-3d48e2b282d6",
//                           "Region": "ap-southeast-1"
//                       }
//                   }
//               },
//                 "CognitoUserPool": {
//                     "Default": {
//                         "PoolId": "ap-southeast-1_8pZqGXCQC",
//                         "AppClientId": "qneld6il88gik7pmg4gsjboi7",
//                         "AppClientSecret": "",
//                         "Region": "ap-southeast-1"
//                     }
//                 },
//                 "Auth": {
//                     "Default": {
//                         "authenticationFlowType": "USER_SRP_AUTH"
//                     }
//                 }
//             }
//         }
//     }
// }''';

// QA

const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                  "CognitoIdentity": {
                      "Default": {
                          "PoolId": "ap-southeast-1:7a563124-3245-46d2-9b59-e9f4c68aa513",
                          "Region": "ap-southeast-1"
                      }
                  }
              },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-southeast-1_7DekKmSFr",
                        "AppClientId": "2mbtiefg8cftcb8onv1pcv8u02",
                        "AppClientSecret": "",
                        "Region": "ap-southeast-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';
