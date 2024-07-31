

import Foundation

class LoginViewModel: BaseViewModel {
    @Published var loginModel: LoginModel?
    
    func callLoginApi(email: String, password: String) {
//        if let validationError = validateInput(email: email, password: password) {
//            CustomMethods.showSucessAlertViewController(validationError)
//            return
//        }
        CustomMethods.showLoader()
        APIClient.login(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            CustomMethods.hideLoader()
            switch result {
            case .success(let model):
                
                CustomMethods.showSucessAlertViewController(model.message ?? "")
        
            case .failure(let error):
                debugPrint(error)
                CustomMethods.showSucessAlertViewController(error.localizedDescription)
            }
        }
    }
 
   
        private func validateInput(email: String, password: String) -> String? {
        if !Validation.isValidEmail(email) {
            return LocalText.invalidEmail
        }
        if !Validation.isValidPassword(password) {
            return LocalText.invalidPassword
        }
        return nil
    }
}

