//
//  TabView.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct MainView: View {
    @State private var showSettings = false
    let settingsManager = SettingsManager.shared
    @State var navigationTitle = ""
    
    @Environment(\.calendar) var calendar
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "OpenSans-Regular", size: 16)!, .foregroundColor: UIColor(AppColor.black)]
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor(AppColor.white)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let appearance_tab = UITabBarAppearance()
        appearance_tab.shadowColor = .clear
        appearance_tab.backgroundColor = UIColor(AppColor.white)
        appearance_tab.stackedLayoutAppearance.normal.iconColor = UIColor(AppColor.black)
//        appearance_tab.stackedLayoutAppearance.selected.iconColor = UIColor(AppColor.purple)
        UITabBar.appearance().standardAppearance = appearance_tab
        UITabBar.appearance().scrollEdgeAppearance = appearance_tab
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                CalendarRootView()
                    .tabItem {
                        Image("CustomCalendar")
                    }
                    .onAppear() {
                        navigationTitle = "Calendar"
                    }
                
                DetailView()
                    .tabItem {
                        Image(systemName: "text.justify.left")
                    }
                    .onAppear() {
                        navigationTitle = "Detail"
                    }
                
                AnalysisView()
                    .tabItem {
                        Image(systemName: "chart.bar")
                    }
                    .onAppear() {
                        navigationTitle = "Analysis"
                    }
                
                ManageView()
                    .tabItem {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .onAppear() {
                        navigationTitle = "Manage"
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
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
        .fullScreenCover(isPresented: $showSettings, content: SettingsView.init)
    }
}
