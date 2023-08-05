//
//  Components.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/5/23.
//

import Foundation
import SwiftUI

struct RoundNavLink<Destination: View>: View {
    /// A `View` representing the destination view for the navigation link.
    let destination: Destination
    /// A `String` representing the text displayed in the component.
    let label: String
    /// A `Color` representing the fill color of the component.
    let foregroundColor: Color
    /// A `Color` representing the text color of the component.
    let backgroundColor: Color
    /// A `Bool` to invert the colors and add an outline to the component.
    let secondaryAction: () -> Void
    /// A `Bool` that tracks whether the component has been pressed
    @State private var pressed: Bool = false


    
    init(destination: Destination, label: String, foregroundColor: Color, backgroundColor: Color, secondaryAction: @escaping () -> Void = {}) {
        self.destination = destination
        self.label = label
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.secondaryAction = secondaryAction
    }
    
    var body: some View {
        NavigationLink (
            destination: destination,
            isActive: $pressed,
            label: {
                HStack {
                    Text(label)
                        .font(.title2)
                        .bold()
                        .foregroundColor(foregroundColor)
                        .multilineTextAlignment(.center)
                        .padding(6)
                }
                .frame(maxWidth: 300)
                .frame(minHeight: 50)
                .background(backgroundColor)
                .cornerRadius(25)
            })
        .padding(.horizontal)
        .onChange(of: pressed) {
            newValue in
            if newValue {
                secondaryAction()
            }
        }
    }
}
