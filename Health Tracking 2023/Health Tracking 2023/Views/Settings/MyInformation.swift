//
//  Settings_Name.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/8/23.
//

import SwiftUI

struct SettingsView_Name: View {
    @State var userName = SettingsManager.shared.loadUserName()
    let settingsManager = SettingsManager.shared
    var body: some View {
        VStack {
            HStack {
                Text("Preferred Name")
                    .font(.title1)
                    .foregroundColor(AppColor.black)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            .padding(.bottom, 2)
            
            Divider()
                .overlay(
                    AppColor.lightgrey
                )
            
            TextField("", text: $userName)
                .padding(.horizontal, 16)
                .padding(.vertical, 2)
                .accentColor(AppColor.black)
                .foregroundColor(AppColor.black)
                .font(.title2)
                .onSubmit {
                    settingsManager.saveUserName(userName)
                }
            
            Divider()
                .overlay(
                    AppColor.lightgrey
                )
            
            Spacer()
        }
    }
}
