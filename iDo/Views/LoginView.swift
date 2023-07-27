//
//  LoginView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    @State var showRegisterView = false

    
    private let backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.3803921569, blue: 0.9450980392, alpha: 1)
    private let circleColor = #colorLiteral(red: 0.4235294118, green: 0.4550011287, blue: 0.937254902, alpha: 1)
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                
                //Header
                VStack {
                    HStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .foregroundColor(Color.green)
                            .frame(width: 35, height: 35)
                            .bold()
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
                        .background(Color.green)
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
                                    showRegisterView = true
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
            
            RegisterView(showRegisterView: $showRegisterView)
                .offset(y: showRegisterView ? UIScreen.main.bounds.width / 10 : UIScreen.main.bounds.width * 2)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
