


import SwiftUI


class Coordinator: ObservableObject {
    static let shared = Coordinator()
    private init() {
        
    }
    @Published var path = NavigationPath()
    var pages = [Page]()
    func push(_ page: Page) {
        path.append(page)
        pages.append(page)
    }
    
    func pop() {
        path.removeLast()
        pages.removeLast()
    }
    func popTo(_ page: Page) {
        
        if pages.contains(page) {
            for item in pages.reversed() {
                if item == page {
                    break
                }
                path.removeLast()
                pages.removeLast()
                
            }
        }  else if page == .login {
            self.popToSignup()
            return
        }
    }
    func popToRoot() {
        path.removeLast(path.count)
        pages.removeLast(pages.count)
    }
    
    
    private func popToSignup() {
        self.popToRoot()
        self.push(.register)
    }
    @ViewBuilder
    func build(page: Page) -> some View {
        if pages.isEmpty {
            pages.append(page)
        }
        return page.view()
    }
}
