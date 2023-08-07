//
//  Welcome1.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/5/23.
//

import SwiftUI

struct Welcome1: View {
    let gradient = LinearGradient(gradient: Gradient(colors: [AppColor.purple, AppColor.lightblue]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.white
                    .edgesIgnoringSafeArea([.vertical])
                
                VStack {
                    Spacer()
                    Welcome1Squiggle()
                        .fill(
                            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                        )
                        .frame(height: 460)
                }
                .edgesIgnoringSafeArea([.bottom])
                
                VStack {
                    Spacer()
                        .frame(height: 120)
                    
                    gradient
                        .edgesIgnoringSafeArea([.horizontal])
                        .mask (
                            VStack {
                                HStack {
                                    Text("Welcome to")
                                        .font(.custom("OpenSans-ExtraBold", size: 64))
                                        .tracking(-5)
                                    Spacer()
                                }
                                HStack {
                                    Text("Dahlia")
                                        .font(.custom("OpenSans-ExtraBold", size: 64))
                                        .tracking(-5)
                                    Spacer()
                                }
                                Spacer()
                            }
                        )
                    
                    
                    Spacer()
                    
                    RoundNavLink(destination: Welcome2(), label: "Get Started", foregroundColor: AppColor.black, backgroundColor: AppColor.white)
                    
                    Spacer()
                        .frame(height: 80)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct Welcome1Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.31524*width, y: 0.15965*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.47657*height), control1: CGPoint(x: 0.08514*width, y: 0.20661*height), control2: CGPoint(x: 0, y: 0.47657*height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addCurve(to: CGPoint(x: 0.81178*width, y: 0.15965*height), control1: CGPoint(x: width, y: 0), control2: CGPoint(x: 0.98148*width, y: 0.10225*height))
        path.addCurve(to: CGPoint(x: 0.31524*width, y: 0.15965*height), control1: CGPoint(x: 0.64208*width, y: 0.21705*height), control2: CGPoint(x: 0.54535*width, y: 0.11269*height))
        path.closeSubpath()
        return path
    }
}

struct Welcome2: View {
    @State var userName: String = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
            
            VStack {
                CustomBackButton()

                Spacer()
                    .frame(height: 60)
                
                HStack {
                    Text("What can we call you?")
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
        .navigationBarBackButtonHidden()
    }
}

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
                    CustomBackButton()
                    
                    Spacer()
                        .frame(height: 40)
                    
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
                            Text("All data is stored locally on your device for ultimate privacy; no cloud backups, no databases. Be sure to back up your data regularly by downloading 'all logs' in Settings.")
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
        .navigationBarBackButtonHidden()
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

struct Welcome4: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
                    
            VStack {
                CustomBackButton()

                Spacer()
                    .frame(height: 40)
                
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
                        Text("Trackers are, essentially, stylized custom input fields. Each tracker consists of a name, an input type, and an icon, and trackers can be grouped together under a label. Easily add data to your trackers in the Detail View.")
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
                        Text("Analyses are how you can view large amounts of your data at a glance. Choose which data to include in your custom graphs and lists. View your analyses on the Analysis View.")
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
                        Text("Trackers and analyses are often related and are best understood together; this is what groups are for! Because a tracker or analysis might be relevant to multiple gorups, individual trackers and analyses can be added to any number of groups. Groups can also be used to easily download a particular subset of your data.")
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
        .navigationBarBackButtonHidden()
    }
}

struct Welcome5: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
                    
            VStack {
                CustomBackButton()

                Spacer()
                    .frame(height: 40)
                
                HStack {
                    Text("Viewing")
                        .font(.custom("OpenSans-Bold", size: 40))
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 40)
                
                Group {
                    HStack {
                        Text("Calendar")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Calendar is your home page to get a big picture sense of what you've tracked lately.")
                            .font(.body)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                }
                
                Group {
                    HStack {
                        Text("Detail")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Detail view is your place to view additional details about the things you've tracked and add your data each day.")
                            .font(.body)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                }
                
                Group {
                    HStack {
                        Text("Analysis")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Inspect your analyses in analysis view; use the scroll wheel to easily find your data at any date.")
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
                        Welcome6()
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
        .navigationBarBackButtonHidden()
    }
}

struct Welcome6: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea([.vertical])
                    
            VStack {
                CustomBackButton()

                Spacer()
                    .frame(height: 40)
                
                HStack {
                    Text("That's it!")
                        .font(.custom("OpenSans-Bold", size: 40))
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 40)
                
                HStack {
                    Text("You're ready to explore your new home for customized health tracking! As a first step, navigate to Settings and create your first custom input type.")
                        .font(.body)
                    Spacer()
                }
                
                
                Spacer()
                
                HStack {
                    Spacer()

                    NavigationLink {
                        CalendarView()
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
        .navigationBarBackButtonHidden()
    }
}
