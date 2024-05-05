import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct KanbulansApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            OnBoardScreen()
        }
    }
}
