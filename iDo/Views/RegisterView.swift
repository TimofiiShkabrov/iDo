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
        ZStack {
            Color.white
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showRegisterView = false
                        }
                        
                    }) {
                        Image(systemName: "xmark.circle")
                    }
                    .foregroundColor(Color.blue)
                    .padding(.trailing)
                    .padding(.bottom)
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
                            
                            Divider()
                        }
                        .padding(.bottom, 15)
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width / 10)
                    
                    
                    VStack {
                        Button(action: {
                            registerViewModel.register()
                            showRegisterView = false
                        }) {
                            Text("Sing Up")
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width / 3)
                                .padding()
                        }
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding(.top, 45)
                    }
                }
                
                Spacer()
            }
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    @State static var showRegisterView = true
    
    static var previews: some View {
        RegisterView(showRegisterView: $showRegisterView)
    }
}
