//
//  LoginView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    
    private let lightBlueColor = #colorLiteral(red: 0.4470588235, green: 0.4431372549, blue: 0.9882352941, alpha: 1)
    private let darkBlueColor = #colorLiteral(red: 0.1607843137, green: 0.1843137255, blue: 0.9921568627, alpha: 1)
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                //Header
                VStack {
                    HStack {
                        Image("logo-png")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("iDO")
                            .font(.system(size: 50))
                    }
                    Text("Turn your ideas into action!")
                        .fontWeight(.light)
                }
                
                Spacer()
                
                //Login form
                
                VStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            if !loginViewModel.errorMassage.isEmpty {
                                Text(loginViewModel.errorMassage)
                                    .foregroundColor(Color.red)
                                    .padding(.bottom)
                            }
                            Text("Email")
                                .font(.headline)
                                .fontWeight(.light)
                                .opacity(0.75)
                            HStack {
                                TextField("Enter Your Email", text: $loginViewModel.email)
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
                            SecureField("Enter Your Password", text: $loginViewModel.password)
                            
                            Divider()
                        }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width / 10)
                    
                    VStack {
                        Button(action: {
                            loginViewModel.login()
                        }) {
                            Text("Sing In")
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width / 3)
                                .padding()
                        }
                        .background(Color(lightBlueColor))
                        .clipShape(Capsule())
                        .padding(.top, 45)
                        
                        Text("or")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .padding(.top)
                        
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(Color.gray.opacity(0.5))
                            Button(action: {
                                withAnimation {
                                    loginViewModel.showRegisterView = true
                                }
                                
                            }) {
                                Text("Sign Up")
                            }
                            .foregroundColor(Color.blue)
                        }
                        .padding(.top)
                    }
                }
                
                Spacer()
            }
            .sheet(isPresented: $loginViewModel.showRegisterView) {
                RegisterView(showRegisterView: $loginViewModel.showRegisterView)
                    .cornerRadius(50)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
