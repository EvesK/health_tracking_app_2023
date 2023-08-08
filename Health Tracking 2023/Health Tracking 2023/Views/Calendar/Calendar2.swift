//
//  Calendar2.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/8/23.
//

import SwiftUI

struct Calendar2: View {
    @Binding var display: String
    @State var navigate: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Calendar2")
                Button {
                    navigate = true
                    display = "Calendar1"
                } label: {
                    Text("Go to Calendar 1")
                }
            }
            .navigationDestination(isPresented: $navigate) {
                Calendar1(display: $display)
            }
        }
    }
}
