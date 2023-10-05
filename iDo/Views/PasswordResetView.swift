//
//  PasswordResetView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 25.08.2023.
//

import SwiftUI

struct PasswordResetView: View {
    @State private var email = ""
    @State private var resetSuccess = false
    @State private var resetError: Error?
    
    @Binding var showPasswordResetView: Bool
    
    @StateObject var passwordResetViewModel = PasswordResetViewModel()
    
    var body: some View {
        VStack {
            HStack {
                
                SwipeButtonView()
                
            }
            .padding(.vertical)
            
            HStack {
                Text("Enter your Email")
                    .font(.headline)
                    .fontWeight(.light)
                .opacity(0.75)
                Spacer()
            }
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .padding(.vertical)
            
            Divider()
            
            Button(action: {
                PasswordResetViewModel().resetPassword(email: email) { success, error in
                    if success {
                        resetSuccess = true
                        showPasswordResetView = false
                    } else {
                        resetError = error
                    }
                }
            }) {
                Text("Reset password")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .padding()
                    .background(Color("lightBlueColor"))
                    .clipShape(Capsule())
                    .padding(.top)

            }
            .padding()
            
            Image(systemName: "info.circle")
            .padding(.top)
            Text("When you reset your password, an Email will be sent to you with further instructions.")
                .font(.subheadline)
            
            if resetSuccess {
                Text("A password reset email has been sent to the provided email.")
                    .foregroundColor(.green)
                    .padding()
            }
            if let resetError = resetError {
                Text("Password reset error:\(resetError.localizedDescription)")
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }
        .padding(.vertical)
        .padding(.horizontal, UIScreen.main.bounds.width / 10)
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    
    @State static var showRegisterView = true
    
    static var previews: some View {
        PasswordResetView(showPasswordResetView: $showRegisterView)
    }
}

