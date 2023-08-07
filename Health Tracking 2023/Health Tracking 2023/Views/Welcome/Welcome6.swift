//
//  Welcome6.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import Foundation
import SwiftUI

struct Welcome6: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
                    
            VStack {
                Spacer()
                    .frame(height: 60)
                
                HStack {
                    Text("That's it!")
                        .font(.custom("OpenSans-Bold", size: 40))
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 40)
                
                HStack {
                    Text("Besides your preferred name, Dahlia does not collect any identifying information. You decide what information to store.")
                        .font(.body)
                    Spacer()
                }
                
                
                Spacer()
                
                HStack {
                    Spacer()

                    NavigationLink {
                        Calendar()
                    } label: {
                        HStack {
                            Text("Done")
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
                
                Spacer()
                    .frame(height: 60)
            }
            .foregroundColor(AppColor.white)
            .padding(.horizontal, 40)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())    }
}

