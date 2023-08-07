//
//  Welcome2.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/5/23.
//

import SwiftUI

struct Welcome2: View {
    @State var userName: String = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
            
            VStack {
                Spacer()
                    .frame(height: 120)
                
                HStack {
                    Text("What should I call you?")
                        .font(.custom("OpenSans-SemiBold", size: 46))
                        .foregroundColor(AppColor.white)
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 160)
                
                Group {
                    TextField("", text: $userName)
                        .accentColor(AppColor.white)
                        .foregroundColor(AppColor.white)
                        .font(.custom("OpenSans-SemiBold", size: 46))
                    CustomDivider()
                    HStack {
                        Spacer()

                        NavigationLink {
                            Welcome3(userName: userName)
                        } label: {
                            HStack {
                                Text("Continue")
                                    .font(.custom("OpenSans-Regular", size: 12))
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .frame(width: 16, height: 8)
                            }
                            .foregroundColor(AppColor.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(AppColor.white, lineWidth: 1)
                        )
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 40)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}
