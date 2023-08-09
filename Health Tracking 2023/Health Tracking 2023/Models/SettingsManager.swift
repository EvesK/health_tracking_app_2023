//
//  SettingsManager.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/8/23.
//

import Foundation
import SwiftUI

class SettingsManager: ObservableObject {
    public static var shared = SettingsManager()
    private let userDefaults = UserDefaults.standard
        
    func saveUserName(_ name: String) {
        userDefaults.set(name, forKey: "userName")
    }
    
    func loadUserName() -> String {
        guard let name = userDefaults.object(forKey: "userName") as? String else {return ""}
        return name
    }
    
    func saveScrollCalendar(_ value: Bool) {
        userDefaults.set(value, forKey: "scrollCalendar")
    }
    
    func loadScrollCalendar() -> Bool {
        guard let value = userDefaults.object(forKey: "scrollCalendar") as? Bool else {return true}
        return value
    }
}

