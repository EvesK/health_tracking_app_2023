//
//  Calendar.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct CalendarView: View {
    @State var display: String = "Calendar1"
    var body: some View {
        if display == "Calendar1" {
            Calendar1(display: $display)
        } else {
            Calendar2(display: $display)
        }
    }
}
