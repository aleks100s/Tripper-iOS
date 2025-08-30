//
//  TripperApp.swift
//  Tripper
//
//  Created by Alexander on 28.08.2025.
//

import SwiftUI

@main
struct TripperApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ApplicationRoot()
        }
    }
}
