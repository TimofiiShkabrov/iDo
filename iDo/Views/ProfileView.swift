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
                    //  avatar
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.white)
                                .shadow(radius: 10)
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
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Email: ")
                                    .bold()
                                Text(user.email)
                            }
                            .padding(.bottom, 10)
                            HStack {
                                Text("Join date: ")
                                    .bold()
                                Text("\(Date(timeIntervalSince1970: user.joinDate).formatted(date: .abbreviated, time: .shortened))")
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            //Delete account
                            Button(action: {
                                profileViewModel.showingAlert = true
                            }) {
                                HStack {
                                    Text("Delete account")
                                        .font(.subheadline)
                                    Image(systemName: "trash")
                                        .font(.subheadline)
                                }
                                .foregroundColor(.white)
                                .padding(5)
                                .padding(.horizontal)
                            }
                            .background(Color.red)
                            .clipShape(Capsule())
                            
                            //log out
                            Button(action: {
                                profileViewModel.logOut()
                            }) {
                                HStack {
                                    Text("Log out")
                                        .font(.subheadline)
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                        .font(.subheadline)
                                }
                                .foregroundColor(.white)
                                .padding(5)
                                .padding(.horizontal)
                            }
                            .background(Color.green)
                            .clipShape(Capsule())
                        }
                        .padding(.bottom, 5)
                    }
                } else {
                    VStack {
                        Text("Loading user data...")
                        //log out
                        HStack {
                            //Delete account
                            Button(action: {
                                profileViewModel.showingAlert = true
                            }) {
                                HStack {
                                    Text("Delete account")
                                        .font(.subheadline)
                                    Image(systemName: "trash")
                                        .font(.subheadline)
                                }
                                .foregroundColor(.white)
                                .padding(5)
                                .padding(.horizontal)
                            }
                            .background(Color.red)
                            .clipShape(Capsule())
                            
                            //log out
                            Button(action: {
                                profileViewModel.logOut()
                            }) {
                                HStack {
                                    Text("Log out")
                                        .font(.subheadline)
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                        .font(.subheadline)
                                }
                                .foregroundColor(.white)
                                .padding(5)
                                .padding(.horizontal)
                            }
                            .background(Color.green)
                            .clipShape(Capsule())
                        }

                    }
                    .padding(.bottom, 5)
                }
            }
            .padding(.top)
        }
        .alert(isPresented: $profileViewModel.showingAlert) {
            Alert(
                title: Text("Do you want to delete an account?"),
                message: Text("Do you really want to delete your account? Once deleted, the data cannot be restored."),
                primaryButton: .destructive(Text("Delete"), action: {
                    profileViewModel.deleteUser()
                }), 
                secondaryButton: .cancel()
            )
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
