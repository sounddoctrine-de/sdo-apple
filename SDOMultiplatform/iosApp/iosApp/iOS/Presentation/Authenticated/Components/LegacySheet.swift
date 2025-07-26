//
//  SheetPresentationView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 24/10/2022.
//

import SwiftUI
import UIKit

/// SwiftUI representation of the `UISheetPresentationController` in UIKit
struct LegacySheetPresentation<Content>: UIViewRepresentable where Content: View {
    @Binding var isPresented: Bool
    let onDismiss: (() -> Void)?
    let detents: [UISheetPresentationController.Detent]
    let content: Content
    
    
    init(
        _ isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        detents: [UISheetPresentationController.Detent] = [.medium()],
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.detents = detents
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Create the UIViewController that will be presented by the UIButton
        let viewController = UIViewController()
        
        // Create the UIHostingController that will embed the SwiftUI View
        let hostingController = UIHostingController(rootView: content)
        
        // Add the UIHostingController to the UIViewController
        viewController.addChild(hostingController)
        viewController.view.addSubview(hostingController.view)
        
        // Set constraints
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leftAnchor.constraint(equalTo: viewController.view.leftAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
        hostingController.view.rightAnchor.constraint(equalTo: viewController.view.rightAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
        hostingController.didMove(toParent: viewController)
        
        // Set the presentationController as a UISheetPresentationController
        if let sheetController = viewController.presentationController as? UISheetPresentationController {
            sheetController.detents = detents
            sheetController.prefersGrabberVisible = true
            sheetController.prefersScrollingExpandsWhenScrolledToEdge = false
            sheetController.largestUndimmedDetentIdentifier = LegacySheetDetents.minimized.detentIdentifier
        }
        
        // Set the coordinator (delegate)
        // We need the delegate to use the presentationControllerDidDismiss function
        viewController.presentationController?.delegate = context.coordinator
        
        if isPresented {
            // Present the viewController
            uiView.window?.rootViewController?.present(viewController, animated: true)
        } else {
            // Dismiss the viewController
            uiView.window?.rootViewController?.dismiss(animated: true)
        }
    }
    
    /**
     Creates the custom instance that you use to communicate changes
     from your view controller to other parts of your SwiftUI interface.
     */
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented, onDismiss: onDismiss)
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        @Binding var isPresented: Bool
        let onDismiss: (() -> Void)?
        
        init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil) {
            self._isPresented = isPresented
            self.onDismiss = onDismiss
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            isPresented = false
            if let onDismiss = onDismiss {
                onDismiss()
            }
        }
        
    }
    
}

struct legacySheetViewModifier<SwiftUIContent>: ViewModifier where SwiftUIContent: View {
    @Binding var isPresented: Bool
    let onDismiss: (() -> Void)?
    let detents: [UISheetPresentationController.Detent]
    let swiftUIContent: SwiftUIContent
    
    init(
        isPresented: Binding<Bool>,
        detents: [UISheetPresentationController.Detent] = [.medium()] ,
        onDismiss: (() -> Void)? = nil,
        content: () -> SwiftUIContent
    ) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.swiftUIContent = content()
        self.detents = detents
    }
    
    func body(content: Content) -> some View {
        ZStack {
            LegacySheetPresentation($isPresented,onDismiss: onDismiss, detents: detents) {
                swiftUIContent
            }.fixedSize()
            content
        }
    }
}

extension View {
    /// Presents a `UISheetPresentationController` with the given parameters
    func legacySheet<Content>(
        isPresented: Binding<Bool>,
        detents: [UISheetPresentationController.Detent],
        onDismiss: (() -> Void)?,
        content: @escaping () -> Content
    ) -> some View where Content : View {
            modifier(
                legacySheetViewModifier(
                    isPresented: isPresented,
                    detents: detents,
                    onDismiss: onDismiss,
                    content: content)
            )
        }
}

enum LegacySheetDetents: String {
    case minimized
    
    var detentIdentifier: UISheetPresentationController.Detent.Identifier {
        switch self {
        case .minimized:
            return UISheetPresentationController.Detent.Identifier(rawValue)
        }
    }
}
