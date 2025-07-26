//
//  AppDelegate.swift
//  SDO
//
//  Created by Joel Kingsley on 16/07/2022.
//

import UIKit
import FirebaseCore
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // Configuring Firebase
        FirebaseApp.configure()
        
        // Configuring audio session for video playback
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        }
        catch {
            AppLogger.error("Setting category to AVAudioSessionCategoryPlayback failed.", error.localizedDescription)
        }

        return true
    }
}
