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
            .padding()
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Сбросить пароль") {
                PasswordResetViewModel().resetPassword(email: email) { success, error in
                    if success {
                        resetSuccess = true
                        showPasswordResetView = false
                    } else {
                        resetError = error
                    }
                }
            }
            .padding()
            
            if resetSuccess {
                Text("Письмо для сброса пароля отправлено на указанный email.")
                    .foregroundColor(.green)
                    .padding()
            }
            if let resetError = resetError {
                Text("Ошибка сброса пароля: \(resetError.localizedDescription)")
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }
        .padding()
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    
    @State static var showRegisterView = true
    
    static var previews: some View {
        PasswordResetView(showPasswordResetView: $showRegisterView)
    }
}

