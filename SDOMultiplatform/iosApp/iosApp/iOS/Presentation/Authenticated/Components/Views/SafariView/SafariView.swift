//
//  SafariView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 02/11/2022.
//

import Foundation
import SwiftUI
import SafariServices

/// SwiftUI representation of `SFSafariViewController`
struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}
