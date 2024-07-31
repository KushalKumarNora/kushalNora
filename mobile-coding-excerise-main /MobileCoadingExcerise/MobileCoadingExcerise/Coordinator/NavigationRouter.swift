
import Foundation
import SwiftUI

public enum NavigationTranisitionStyle {
    case push
    case presentModally
    case presentFullscreen
}


public protocol NavigationRouter {
    
    associatedtype V: View

    var transition: NavigationTranisitionStyle { get }
    
   
    @ViewBuilder
    func view() -> V
}


