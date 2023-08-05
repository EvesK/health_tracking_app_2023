//
//  Welcome1.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/5/23.
//

import SwiftUI

struct Welcome1: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 200)
                
                Text("Welcome")
                    .font(.custom("OpenSans-ExtraBold", size: 74))
                    .foregroundStyle(LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .leading, endPoint: .trailing))
                
                Spacer()
                
                RoundNavLink(destination: Welcome2(), label: "Get Started", foregroundColor: AppColor.black, backgroundColor: AppColor.white)
                
                Spacer()
                    .frame(height: 100)
            }
        }
    }
}
