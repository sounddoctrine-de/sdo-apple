import SwiftUI
import GoogleSignIn

//@main
//struct iOSApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


@main
struct iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var authViewModel = AuthenticationViewModel()
    
    init() {
        SDOTheme.initializeTheme()
    }
    
    var body: some Scene {
        WindowGroup {
          ContentView()
            .environmentObject(authViewModel)
            .onAppear {
                authViewModel.restorePreviousSignIn()
            }
            .onOpenURL { url in
              GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
}
