//
//  ProfileView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = profileViewModel.user {
                    // avatar
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.white)
                                .shadow(radius: 20)
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 70, height: 70)
                        }
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Hi, there!")
                                .bold()
                                .font(.title2)
                            Text(user.name)
                                .bold()
                                .font(.title)
                            Text("To complete tasks you only need inspiration, and iDo can handle the rest!")
                                .font(.subheadline)
                                .padding(.top, 5)
                                .padding(.trailing)
                        }
                    }
                    // info
                    Divider()
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .font(.title2)
                        .padding(.bottom, 10)
                        HStack {
                            Text("Join date: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joinDate).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .font(.title2)
                    }
                    
                    Spacer()
                    
                    //log out
                    Button(action: {
                        profileViewModel.logOut()
                    }) {
                        HStack {
                            Text("Log out")
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                    }
                    .background(Color.green)
                    .clipShape(Capsule())
                    .padding(.top, 45)
                } else {
                    Text("Loading user data...")
                }
            }
            .padding(.top)
        }
        .onAppear {
            profileViewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
