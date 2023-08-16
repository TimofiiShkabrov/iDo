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
            ZStack {
                Image("lcbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .offset(y: UIScreen.main.bounds.maxY / 2.5)
                VStack {
                    if let user = profileViewModel.user {
                        // avatar
                        ZStack {
                            Circle()
                                .frame(width: 110, height: 110)
                                .foregroundColor(Color.white)
                                .shadow(radius: 20)
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 90, height: 90)
                        }
                        .padding()
                        // info
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Name: ")
                                    .bold()
                                Text(user.name)
                            }
                            .font(.title2)
                            HStack {
                                Text("Email: ")
                                    .bold()
                                Text(user.email)
                            }
                            .font(.title2)
                            HStack {
                                Text("Join date: ")
                                    .bold()
                                Text("\(Date(timeIntervalSince1970: user.joinDate).formatted(date: .abbreviated, time: .shortened))")
                            }
                            .font(.title2)
                        }
                        
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
            }
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
