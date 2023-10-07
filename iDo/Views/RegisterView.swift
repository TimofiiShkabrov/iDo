//
//  RegisterView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel = RegisterViewModel()
    @Binding var showRegisterView: Bool
    
    var body: some View {
        VStack {
            HStack {
                
                SwipeButtonView()
                
            }
            .padding()
            //Header
            VStack {
                Text("Turn your ideas into action!")
                    .fontWeight(.light)
            }
            .padding(.bottom)
            
            //Login form
            VStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Name")
                            .font(.headline)
                            .fontWeight(.light)
                            .opacity(0.75)
                        HStack {
                            TextField("Enter Your Name", text: $registerViewModel.name)
                                .autocorrectionDisabled()
                        }
                        
                        Divider()
                    }
                    .padding(.bottom, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.headline)
                            .fontWeight(.light)
                            .opacity(0.75)
                        HStack {
                            TextField("Enter Your Email", text: $registerViewModel.email)
                                .autocapitalization(.none)
                                .autocorrectionDisabled()
                        }
                        
                        Divider()
                    }
                    .padding(.bottom, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .opacity(0.75)
                        SecureField("Enter Your Password", text: $registerViewModel.password)
                        Text("Password must be at least 6 characters")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Divider()
                    }
                }
                
                VStack {
                    Button(action: {
                        registerViewModel.createUser()
                        showRegisterView = false
                    }) {
                        Text("Sing Up")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .padding()
                    }
                    .background(Color("lightBlueColor"))
                    .clipShape(Capsule())
                    .padding(.top)
                    
                    ScrollView {
                        Image(systemName: "info.circle")
                            .padding(.top)
                        Text("Simple registration without email confirmation will allow you to easily access your task list from any device, giving you the convenience and flexibility to use the app.")
                            .font(.subheadline)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, UIScreen.main.bounds.width / 10)
    }
}


struct RegisterView_Previews: PreviewProvider {
    @State static var showRegisterView = true
    
    static var previews: some View {
        RegisterView(showRegisterView: $showRegisterView)
    }
}
