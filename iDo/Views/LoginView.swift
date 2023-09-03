//
//  LoginView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var passwordResetViewModel = PasswordResetViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                //Header
                HeaderLoginView()
                    .shadow(radius: 20)
                //Login form
                VStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            if !loginViewModel.errorMassage.isEmpty {
                                Text(loginViewModel.errorMassage)
                                    .foregroundColor(Color.red)
                                    .fixedSize(horizontal: false, vertical: true)
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
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    withAnimation {
                                        passwordResetViewModel.showPasswordResetView = true
                                    }
                                }) {
                                    Text("Forgot your password?")
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    VStack {
                        Button(action: {
                            loginViewModel.login()
                        }) {
                            Text("Sing In")
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width / 3)
                                .padding()
                                .background(Color("lightBlueColor"))
                                .clipShape(Capsule())
                        }
                        .padding(.top, 25)
                        
                        Text("or")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .padding(.top, 10)
                        
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
                        .padding(.top, 5)
                    }
                }
                .padding(.vertical, 30)
                .background(
                    Image("lcbg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .rotationEffect(Angle(degrees: 180))
                        .opacity(0.3)
                )
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 2)
                .padding(.top, UIScreen.main.bounds.width / 2)
            }
            .sheet(isPresented: $loginViewModel.showRegisterView) {
                RegisterView(showRegisterView: $loginViewModel.showRegisterView)
                    .cornerRadius(50)
            }
            .sheet(isPresented: $passwordResetViewModel.showPasswordResetView) {
                PasswordResetView(showPasswordResetView: $passwordResetViewModel.showPasswordResetView)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
