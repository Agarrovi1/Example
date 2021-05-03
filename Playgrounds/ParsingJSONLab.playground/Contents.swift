import UIKit

var randomUsers = """
{
    "results": [
        {
            "gender": "female",
            "name": {
                "title": "Miss",
                "first": "Julia",
                "last": "Haapala"
            },
            "location": {
                "street": {
                    "number": 3428,
                    "name": "Hämeenkatu"
                },
                "city": "Haapajärvi",
                "state": "North Karelia",
                "country": "Finland",
                "postcode": 16947,
                "coordinates": {
                    "latitude": "-12.3593",
                    "longitude": "156.7039"
                },
                "timezone": {
                    "offset": "+2:00",
                    "description": "Kaliningrad, South Africa"
                }
            },
            "email": "julia.haapala@example.com",
            "login": {
                "uuid": "71585305-1042-49af-8fbe-d528d357f551",
                "username": "tinyswan437",
                "password": "raining",
                "salt": "btiKM9W9",
                "md5": "b9888cb0bd4443c9cb2b6b168d3d66a9",
                "sha1": "af19f6c94eae99f5d71de6fb39ec8c13aafa1e25",
                "sha256": "10e14b9e5febb2b6ba96c286d9a7c242cb39c1638358f39408869ca46418bf57"
            },
            "dob": {
                "date": "1952-11-13T02:53:53.571Z",
                "age": 68
            },
            "registered": {
                "date": "2011-01-06T23:45:46.800Z",
                "age": 9
            },
            "phone": "03-349-331",
            "cell": "042-987-76-63",
            "id": {
                "name": "HETU",
                "value": "NaNNA552undefined"
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/women/80.jpg",
                "medium": "https://randomuser.me/api/portraits/med/women/80.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/women/80.jpg"
            },
            "nat": "FI"
        },
        {
            "gender": "male",
            "name": {
                "title": "Mr",
                "first": "Kaya",
                "last": "Keçeci"
            },
            "location": {
                "street": {
                    "number": 1653,
                    "name": "Abanoz Sk"
                },
                "city": "Afyonkarahisar",
                "state": "Yalova",
                "country": "Turkey",
                "postcode": 62615,
                "coordinates": {
                    "latitude": "-43.5736",
                    "longitude": "153.2778"
                },
                "timezone": {
                    "offset": "-12:00",
                    "description": "Eniwetok, Kwajalein"
                }
            },
            "email": "kaya.kececi@example.com",
            "login": {
                "uuid": "dcc9a589-4e59-4802-a0f9-74f6f13c6813",
                "username": "lazybutterfly318",
                "password": "gator1",
                "salt": "Cr9y8emW",
                "md5": "fd6b53ac427d9a6c732a4ac4d6e59d25",
                "sha1": "cdc86d1f46b58fd8e6b1667b1d784aeda9db2370",
                "sha256": "66da0c62c248cedb1d7e3b25b3e9732eabaaaf6167dcc602f367403280eea970"
            },
            "dob": {
                "date": "1995-08-11T04:06:09.201Z",
                "age": 25
            },
            "registered": {
                "date": "2008-09-25T07:31:56.291Z",
                "age": 12
            },
            "phone": "(592)-354-1424",
            "cell": "(177)-970-5460",
            "id": {
                "name": "",
                "value": null
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/men/32.jpg",
                "medium": "https://randomuser.me/api/portraits/med/men/32.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/men/32.jpg"
            },
            "nat": "TR"
        },
        {
            "gender": "female",
            "name": {
                "title": "Ms",
                "first": "Brooke",
                "last": "Jones"
            },
            "location": {
                "street": {
                    "number": 101,
                    "name": "New Brighton Road"
                },
                "city": "Tauranga",
                "state": "Hawke'S Bay",
                "country": "New Zealand",
                "postcode": 78326,
                "coordinates": {
                    "latitude": "79.5535",
                    "longitude": "-46.0720"
                },
                "timezone": {
                    "offset": "+5:45",
                    "description": "Kathmandu"
                }
            },
            "email": "brooke.jones@example.com",
            "login": {
                "uuid": "59f36872-6471-4cce-b187-a0db25eb09c4",
                "username": "goldenduck655",
                "password": "toast",
                "salt": "VehJHeJo",
                "md5": "205bc8b77c09456127dc9e7c4c2b3592",
                "sha1": "dfdc414a131f1e20a60dcfbb008511433458bd1e",
                "sha256": "89f8a69754d769c251078e56f1432e9cc145ea7a67514acd2ff76e22b17c46e2"
            },
            "dob": {
                "date": "1983-02-08T04:44:50.016Z",
                "age": 37
            },
            "registered": {
                "date": "2008-04-14T19:52:27.213Z",
                "age": 12
            },
            "phone": "(349)-613-0724",
            "cell": "(506)-003-2251",
            "id": {
                "name": "",
                "value": null
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/women/11.jpg",
                "medium": "https://randomuser.me/api/portraits/med/women/11.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/women/11.jpg"
            },
            "nat": "NZ"
        },
        {
            "gender": "male",
            "name": {
                "title": "Mr",
                "first": "Klaus-Ulrich",
                "last": "Lentz"
            },
            "location": {
                "street": {
                    "number": 5216,
                    "name": "Rosenstraße"
                },
                "city": "Pressath",
                "state": "Mecklenburg-Vorpommern",
                "country": "Germany",
                "postcode": 54723,
                "coordinates": {
                    "latitude": "46.6525",
                    "longitude": "93.0705"
                },
                "timezone": {
                    "offset": "+2:00",
                    "description": "Kaliningrad, South Africa"
                }
            },
            "email": "klaus-ulrich.lentz@example.com",
            "login": {
                "uuid": "1198193e-539b-4515-bfa2-50c379090154",
                "username": "bigbutterfly197",
                "password": "niao",
                "salt": "uPgkUu8c",
                "md5": "c96f7a2cf60e43879d711320ac5eb61d",
                "sha1": "5df9c8e7fcce6bf3f7be231939c0a3d020ee1fdb",
                "sha256": "aa78fa2616789c8c59b164769bec7de4a59244602fcad42f08de14bb9ad7ded0"
            },
            "dob": {
                "date": "1990-11-05T17:52:44.713Z",
                "age": 30
            },
            "registered": {
                "date": "2013-08-24T14:31:48.463Z",
                "age": 7
            },
            "phone": "0494-5757183",
            "cell": "0177-7580371",
            "id": {
                "name": "",
                "value": null
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/men/56.jpg",
                "medium": "https://randomuser.me/api/portraits/med/men/56.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/men/56.jpg"
            },
            "nat": "DE"
        },
        {
            "gender": "female",
            "name": {
                "title": "Madame",
                "first": "Federica",
                "last": "Moulin"
            },
            "location": {
                "street": {
                    "number": 4145,
                    "name": "Rue Saint-Georges"
                },
                "city": "Rickenbach (So)",
                "state": "Glarus",
                "country": "Switzerland",
                "postcode": 9616,
                "coordinates": {
                    "latitude": "-39.5958",
                    "longitude": "6.3347"
                },
                "timezone": {
                    "offset": "+9:30",
                    "description": "Adelaide, Darwin"
                }
            },
            "email": "federica.moulin@example.com",
            "login": {
                "uuid": "3379888c-b775-4a12-85f0-a211da97e69b",
                "username": "heavycat767",
                "password": "allsop",
                "salt": "CvogMwRl",
                "md5": "8b8943bf2f38b647b165678c0f9df710",
                "sha1": "ef2d46e79f4690f35fcfb08441cc71e95600ba1b",
                "sha256": "38e95f951826c9c2d5f25c34200d2f6ad483a15039abbcb1c585f195dfa7e56e"
            },
            "dob": {
                "date": "1992-12-12T01:19:44.439Z",
                "age": 28
            },
            "registered": {
                "date": "2011-05-07T06:29:43.230Z",
                "age": 9
            },
            "phone": "079 500 21 57",
            "cell": "075 398 67 28",
            "id": {
                "name": "AVS",
                "value": "756.8997.0470.29"
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/women/38.jpg",
                "medium": "https://randomuser.me/api/portraits/med/women/38.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/women/38.jpg"
            },
            "nat": "CH"
        }
    ],
    "info": {
        "seed": "17585ea169416c76",
        "results": 5,
        "page": 1,
        "version": "1.3"
    }
}
"""

//Decode this JSON into some type does
//what do we need the JSON to start as, in order to Decode or Serialize it?
let randomUserData = randomUsers.data(using: .utf8) ?? Data()
struct UserWrapper: Codable {
    let results: [User]
    
}


struct User: Codable {
    let gender: String
    let location: Location
    
    struct Location: Codable {
        enum CodingKeys: String, CodingKey {
            case _postCode = "postcode"
        }
        
        var postCode: String {
            return _postCode.value
        }
        private let _postCode: PostCode
        
        struct PostCode: Codable {
            enum PostCodeError: Error {
                case decodeError
            }
            
            let value: String
            
            init(decoder: Decoder) throws {
                var code: String
                if let post = try? decoder.singleValueContainer().decode(Int.self) {
                    code = String(post)
                } else if let post = try? decoder.singleValueContainer().decode(String.self) {
                    code = post
                } else {
                    throw PostCodeError.decodeError
                }
                value = code
            }
        }
    }
    
}


let array = try JSONDecoder().decode(UserWrapper.self, from: randomUserData)
print(array.results)
