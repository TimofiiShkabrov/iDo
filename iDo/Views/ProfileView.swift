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
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                    
                    // info
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                            Text(user.name)
                        }
                        HStack {
                            Text("Email: ")
                            Text(user.email)
                        }
                        HStack {
                            Text("Join date: ")
                            Text("\(Date(timeIntervalSince1970: user.joinDate).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                    
                    //log out
                    Button(action: {
                        profileViewModel.logOut()
                    }) {
                        Text("Log out")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .padding()
                    }
                    .background(Color.green)
                    .clipShape(Capsule())
                    .padding(.top, 45)
                } else {
                    Text("Loading user data...")
                }
            }
            .navigationTitle("Yor profile")
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
