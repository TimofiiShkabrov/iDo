//
//  LoginViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMassage = ""    
    
    init() {}
    
        func login() {
            guard validate() else {
                return
            }
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                        guard let self = self else { return }

                        if let error = error {
                            if let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                                switch errorCode {
                                case .userNotFound:
                                    self.errorMassage = "Account not found."
                                default:
                                    self.errorMassage = "An error has occurred: \(error.localizedDescription)"
                                }
                            } else {
                                self.errorMassage = "An unknown error has occurred, please contact support."
                            }
                            return
                        }

                        // Successful authentication
                        if let user = authResult?.user {
                            print("User successfully logged in: \(user.uid)")
                        }
                    }
                }
        
        private func validate() -> Bool{
            errorMassage = ""
            guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                  !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                errorMassage = "Please fill in all fields."
                return false
            }
            guard email.contains("@") && email.contains(".") else {
                errorMassage = "Please enter valid email."
                return false
            }
            return true
        }
    }
