import UIKit
import SwiftUI
import ComposeApp

/**
 Compose Multiplatform View
 */
//struct ComposeView: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        MainViewControllerKt.MainViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//}
//
// struct ContentView: View {
//     var body: some View {
//         ComposeView()
//                 .ignoresSafeArea(.keyboard) // Compose has own keyboard handler
//     }
// }

//struct ContentView: View {
//    @State private var showContent = false
//    var body: some View {
//        VStack {
//            Button("Click me!") {
//                withAnimation {
//                    showContent = !showContent
//                }
//            }
//
//            if showContent {
//                VStack(spacing: 16) {
//                    Image(systemName: "swift")
//                        .font(.system(size: 200))
//                        .foregroundColor(.accentColor)
//                    Text("SwiftUI: \(Greeting().greet())")
//                }
//                .transition(.move(edge: .top).combined(with: .opacity))
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct ContentView: View {
    @State var isNavigationBarHidden: Bool = true
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        return Group {
            switch authViewModel.state {
            case .signedIn:
              #if os(iOS)
                AppTabNavigation(isNavigationBarHidden: self.$isNavigationBarHidden)
              #else
                NotAvailableView()
              #endif
            case .signedOut:
              #if os(iOS)
                SignInView()
              #else
                NotAvailableView()
              #endif
            case .loading:
              #if os(iOS)
                ProgressView("progressViewLoadingLabel")
                    .progressViewStyle(.circular)
              #else
                NotAvailableView()
              #endif
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
}
