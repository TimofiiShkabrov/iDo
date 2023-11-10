//
//  RegisterView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel = RegisterViewModel()
    
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
                        if !registerViewModel.errorMassage.isEmpty {
                            Text(registerViewModel.errorMassage)
                                .foregroundColor(Color.red)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom)
                        }
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
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
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
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding()
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
