//
//  DetailView.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct DetailView: View {
    @State var selectedDay = SettingsManager.shared.loadSelectedDay().formatted(as: "MMMM dd YYYY")
    
    var body: some View {
        VStack {
            Text(selectedDay)
            Text("Detail")
        }
        .onAppear() {
            selectedDay = SettingsManager.shared.loadSelectedDay().formatted(as: "MMMM dd YYYY")
        }
    }
}
