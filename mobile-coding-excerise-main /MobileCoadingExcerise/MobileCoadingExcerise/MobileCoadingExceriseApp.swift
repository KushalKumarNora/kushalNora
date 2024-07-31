

import SwiftUI

@main
struct MobileCoadingExceriseApp: App {
   // let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
               // .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
