//
//  Welcome3.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct Welcome3: View {
    @State var userName: String = ""
    @State var displayMessage: Bool = true
    
    @State var fadeAnimation: Bool = true
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
                        
            if displayMessage {
                HelloMessage(userName: userName)
                    .zIndex(1)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation(.easeOut(duration: 0.6)) {
                                displayMessage = false
                            }
                        }
                    }
                    .opacity(displayMessage ? 1 : 0)
            } else {
                VStack {
                    Spacer()
                        .frame(height: 60)
                    
                    HStack {
                        Text("Privacy")
                            .font(.custom("OpenSans-Bold", size: 40))
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Group {
                        HStack {
                            Text("Identifying Information")
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
                            Text("Data Storage")
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
                            Text("Terms and Conditions")
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
                            Welcome4()
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
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct HelloMessage: View {
    var userName: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Hello\(userName.isEmpty ? "" : " " + userName),")
                    .font(.custom("OpenSans-SemiBold", size: 42))
                    .foregroundColor(AppColor.black)

                Spacer()
            }
            HStack {
                Text("let's get you set up.")
                    .font(.custom("OpenSans-SemiBold", size: 42))
                    .foregroundColor(AppColor.white)
                Spacer()
            }
        }
        .padding(.horizontal, 40)
    }
}
