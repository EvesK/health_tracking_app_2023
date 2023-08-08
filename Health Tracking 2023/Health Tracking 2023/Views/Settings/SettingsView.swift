//
//  SettingsHomeView.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

import SwiftUI

struct SettingsView: View {
    let settingsManager = SettingsManager.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Group {
                        HStack {
                            Text("My Information")
                                .font(.title1)
                                .foregroundColor(AppColor.black)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 20)
                        .padding(.bottom, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                        
                        NavigationLink {
                            SettingsView_Name()
                        } label: {
                            HStack {
                                Text("Preferred Name")
                                    .font(.title2)
                                    .foregroundColor(AppColor.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 12, height: 20)
                                    .foregroundColor(AppColor.lightgrey)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                        
                        Button {
                            settingsManager.saveUserName("")
                        } label: {
                            HStack {
                                Text("Delete All Information")
                                    .font(.title2)
                                    .foregroundColor(AppColor.black)
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                    }
                    
                    Group {
                        HStack {
                            Text("Manage Data")
                                .font(.title1)
                                .foregroundColor(AppColor.black)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 32)
                        .padding(.bottom, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                        
                        NavigationLink {
                            SettingsView_DownloadData()
                        } label: {
                            HStack {
                                Text("Download Data")
                                    .font(.title2)
                                    .foregroundColor(AppColor.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 12, height: 20)
                                    .foregroundColor(AppColor.lightgrey)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                        
                        NavigationLink {
                            SettingsView_DeleteData()
                        } label: {
                            HStack {
                                Text("Delete Data")
                                    .font(.title2)
                                    .foregroundColor(AppColor.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 12, height: 20)
                                    .foregroundColor(AppColor.lightgrey)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                    }
                    
                    Group {
                        HStack {
                            Text("Manage Forms")
                                .font(.title1)
                                .foregroundColor(AppColor.black)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 32)
                        .padding(.bottom, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                        
                        NavigationLink {
                            SettingsView_InputTypes()
                        } label: {
                            HStack {
                                Text("Input Types")
                                    .font(.title2)
                                    .foregroundColor(AppColor.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 12, height: 20)
                                    .foregroundColor(AppColor.lightgrey)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                        
                        NavigationLink {
                            SettingsView_AnalysisTemplates()
                        } label: {
                            HStack {
                                Text("Analysis Templates")
                                    .font(.title2)
                                    .foregroundColor(AppColor.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 12, height: 20)
                                    .foregroundColor(AppColor.lightgrey)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 2)
                        
                        Divider()
                            .overlay(
                                AppColor.lightgrey
                            )
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.custom("OpenSans-Regular", size: 16))
                            .foregroundColor(AppColor.black)
                    }

                }
            }
        }
    }
}
