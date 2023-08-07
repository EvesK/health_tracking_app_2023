//
//  TabView.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Image("CustomCalendar")
                }

            DetailView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}
