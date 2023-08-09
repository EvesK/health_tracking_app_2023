//
//  TabView.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct MainView: View {
    @State private var showSettings = false
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "OpenSans-Regular", size: 16)!, .foregroundColor: UIColor(AppColor.black)]
        }
    
    var body: some View {
        NavigationStack {
            TabView {
                RootView()
                    .tabItem {
                        Image("CustomCalendar")
                    }
                
                DetailView()
                    .tabItem {
                        Image(systemName: "text.justify.left")
                        
                    }
                
                AnalysisView()
                    .tabItem {
                        Image(systemName: "chart.bar")
                    }
                
                ManageView()
                    .tabItem {
                        Image(systemName: "slider.horizontal.3")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .accessibilityLabel("Settings")
                            .foregroundColor(AppColor.black)
                            .padding(.trailing, 10)
                    }
                }
            }
            .navigationTitle("Wednesday April 19")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
        .fullScreenCover(isPresented: $showSettings, content: SettingsView.init)
    }
}
