

import Foundation

struct BaseResponseModel<T: Codable>: Codable {
  
  //  let success: Bool
    let message: String?
  //  let result: T?
    let error : String?
}
struct BaseResponse: Codable {
    let statusCode: Int
    let success: Bool
    let message: String?
    
}

struct BaseResponseModelArray<T: Codable>: Codable {
    let statusCode: Int
    let success: Bool
    let message: String?
    let result: [T]?
}
