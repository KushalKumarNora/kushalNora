

import Foundation
struct AppConstant {
#if DEBUG
    static let baseUrl = "http://127.0.0.1:5001"
#else
    static let baseUrl = "http://127.0.0.1:5001"
#endif
    static let appName = "MobileCoadingExcerise"
}

struct ParameterKey {
    static let userName = "username"
    static let password = "password"
    
    static let fullName = "fullName"
    static let email = "email"
}

enum ContentType: String {
    case json = "application/json"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
struct StatusCode {
    static let success = 200
    static let somthingWantWrong = 400
    static let tokenExpire = 401
}

struct LocalText {
    
    static let invalidEmail = "Please enter valid email"
    static let invalidPassword = "Password must have at least 8 characters, including one uppercase letter, one lowercase letter, one digit, and one special character."
    static let ok = "Ok"
}
