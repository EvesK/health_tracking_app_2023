//
//  Health_Tracking_2023App.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/5/23.
//

import SwiftUI

@main
struct Health_Tracking_2023App: App {
    let settingsManager = SettingsManager.shared
    var body: some Scene {
        WindowGroup {
            let dateHolder = DateHolder()
            if settingsManager.loadUserName().isEmpty {
                Welcome1()
            } else {
                MainView()
            }
        }
    }
}
