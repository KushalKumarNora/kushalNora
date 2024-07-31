


import SwiftUI
import SwiftUICoordinator



public enum Page: NavigationRouter {
   
    
    
    case register
    case login
    case empty
    
    
    
    public var transition: NavigationTranisitionStyle {
        
        switch self {
            
        case .register:
            return .push
        case .login:
            return .push
        case .empty:
            return .push
        }

    }
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .register:
            RegisterView(email: "", password: "", isregister: .constant(false))
                //.navigationBarBackButtonHidden()
        case .login:
            LoginView(email: "", password: "")
               // .navigationBarBackButtonHidden()
       
        case .empty:
            EmptyView()
        }
    }
}


extension Page: Hashable {
    public static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    public var hashValue: Int {
        get {
            switch self {
            case .register:
                return 0
            case .login:
                return 1
            case .empty:
                return 2
            }
        }
    }
    
}
 
