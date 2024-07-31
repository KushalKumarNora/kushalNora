

import Foundation
import UIKit
import MBProgressHUD
import SwiftUI

class CustomMethods {
    private init() {}
    static func showSucessAlertViewController(titile: String = AppConstant.appName, _ message: String) {
        
        DispatchQueue.main.async {
            let alerViewController = UIAlertController(title: titile, message: message, preferredStyle: .alert)
            alerViewController.addAction(UIAlertAction(title: LocalText.ok, style: .cancel, handler: nil))
            self.topViewController().present(alerViewController, animated: true, completion: nil)
        }
        
    }
    
    static func showAletrtViewControllerWithOkAction(titile: String = AppConstant.appName, buttonName: String = LocalText.ok, _ message: String, completion: @escaping (() -> Void)) {
        let alerViewController = UIAlertController(title: titile, message: message, preferredStyle: .alert)
        alerViewController.addAction(UIAlertAction(title: buttonName, style: .default, handler: {_ in completion()}))
        self.topViewController().present(alerViewController, animated: true, completion: nil)
        
    }
    
    
    static func topViewController() -> UIViewController {
        guard let root = UIApplication.shared.windows.first?.rootViewController else {
            return UIViewController()
        }
        return root
    }
    static func showLoader() {
        MBProgressHUD.showAdded(to: self.topViewController().view, animated: true)
    }
    static func hideLoader() {
        MBProgressHUD.hide(for: self.topViewController().view, animated: true)
    }
}
