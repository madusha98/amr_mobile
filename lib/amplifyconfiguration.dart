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
                          "PoolId": "ap-southeast-1:6c00014e-1006-462c-9a71-e71ad4c0993a",
                          "Region": "ap-southeast-1"
                      }
                  }
              },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-southeast-1_zIKlP1scD",
                        "AppClientId": "6rvgnvliqg4ulr277gsc9feml5",
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
