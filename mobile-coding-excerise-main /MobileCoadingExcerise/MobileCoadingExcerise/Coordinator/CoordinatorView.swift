

import SwiftUI
import Foundation



struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator.shared

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .register)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
 
