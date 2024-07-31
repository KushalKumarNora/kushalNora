

import Foundation
import Alamofire
import UIKit

class APIClient {
    private init() {}
    @discardableResult
    private static func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }
    static func login(email: String, password: String, completion: @escaping (Result <BaseResponseModel<LoginModel>, AFError>) -> Void) {
        var parameters = Parameters()
        parameters[ParameterKey.email] = email
        parameters[ParameterKey.password] = password
        performRequest(route: APIRouter.login(params: parameters), completion: completion)
    }
    
    static func registerApi(email: String, password: String, completion: @escaping (Result <BaseResponseModel<RegisterModel>, AFError>) -> Void) {
        var parameters = Parameters()
        parameters[ParameterKey.email] = email
        parameters[ParameterKey.password] = password
        performRequest(route: APIRouter.register(params: parameters), completion: completion)
    }
}
