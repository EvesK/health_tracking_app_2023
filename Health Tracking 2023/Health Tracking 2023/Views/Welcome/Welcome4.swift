//
//  Welcome4.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct Welcome4: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
                    
            VStack {
                Spacer()
                    .frame(height: 60)
                
                HStack {
                    Text("Tracking")
                        .font(.custom("OpenSans-Bold", size: 40))
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 40)
                
                Group {
                    HStack {
                        Text("Trackers")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Besides your preferred name, Dahlia does not collect any identifying information. You decide what information to store.")
                            .font(.body)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                }
                
                Group {
                    HStack {
                        Text("Analyses")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("All data is stored locally on your device for ultimate privacy; no cloud backups, no databases. Be sure to back up your data by downloading all logs in Settings.")
                            .font(.body)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                }
                
                Group {
                    HStack {
                        Text("Groups")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Dahlia is not a medical device.")
                            .font(.body)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                }
                
                Spacer()
                
                HStack {
                    Spacer()

                    NavigationLink {
                        Welcome5()
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
                
                Spacer()
                    .frame(height: 60)
            }
            .foregroundColor(AppColor.white)
            .padding(.horizontal, 40)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())    }
}
