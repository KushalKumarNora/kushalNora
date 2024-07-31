

import Foundation
struct Validation {
    

    static func isValidEmail(_ email: String) -> Bool {
        let newEmail = email.split(separator: "@")
        guard let firstIndex  = newEmail.first, let lastIndex = newEmail.last else {
            return false
        }
        if firstIndex.contains("..") || firstIndex.contains("-") || firstIndex.contains("+") || firstIndex.contains("__") {
            return false
        }
        if lastIndex.contains("..") || lastIndex.contains("-") || lastIndex.contains("+") || lastIndex.contains("__") {
            return false
        }
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    static func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
  
    
   
}
