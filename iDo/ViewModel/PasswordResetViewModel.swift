//
//  PasswordResetViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 25.08.2023.
//

import Foundation
import FirebaseAuth

class PasswordResetViewModel: ObservableObject {
    
    @Published var showPasswordResetView = false
    
    func resetPassword(email: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Ошибка сброса пароля: \(error.localizedDescription)")
                completion(false, error)
            } else {
                print("Письмо для сброса пароля отправлено на указанный email.")
                completion(true, nil)
            }
        }
    }
}

