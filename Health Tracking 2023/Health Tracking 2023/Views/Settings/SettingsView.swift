//
//  SettingsHomeView.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("My Information")
                    NavigationLink {
                        SettingsView_Name()
                    } label: {
                        Text("Preferred Name")
                    }
                    
                    
                    Text("Manage Data")
                    NavigationLink {
                        SettingsView_DownloadData()
                    } label: {
                        Text("Download Data")
                    }
                    
                    Text("Manage Forms")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.custom("OpenSans-Regular", size: 16))
                            .foregroundColor(AppColor.black)
                    }

                }
            }
        }
    }
}
