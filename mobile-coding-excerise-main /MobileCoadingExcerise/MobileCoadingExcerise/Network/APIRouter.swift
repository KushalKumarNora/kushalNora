

import Foundation
import Alamofire

// swiftling:disable switch_case
enum APIRouter: URLRequestConvertible {
    case login(params: Parameters)
    case register(params: Parameters)
    

    private var method: HTTPMethod {
        switch self {

        case .login:
            return .post
            
        case.register:
            return .post
        }
    }
    // MARK: - HTTPHeaders
    private var headers: HTTPHeaders {
        let requestHeaders = HTTPHeaders()

        switch self {

        case .login:
            return requestHeaders
            
        case .register:
            return requestHeaders
        }
    }
    private var parameters: Parameters {
        switch self {
        case .login(let parameter):
            return parameter
        
        case .register(params: let parameter):
            return parameter
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return "/api/login"
        case.register:
            return "/api/register"
       
        }
    }

    func printPath()-> String {
        return self.path
    }
    func asURLRequest() throws -> URLRequest {
        let url = try AppConstant.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: self.parameters, options: [])
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.headers = self.headers
        return urlRequest
    }
}
