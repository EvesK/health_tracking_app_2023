//
//  Calendar1.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/8/23.
//

import SwiftUI

struct Calendar1: View {
    @Binding var display: String
    @State var navigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Calendar1")
                Button {
                    navigate = true
                    display = "Calendar2"
                } label: {
                    Text("Go to Calendar 2")
                }
            }
            .navigationDestination(isPresented: $navigate) {
                Calendar2(display: $display)
            }
        }
    }
}
