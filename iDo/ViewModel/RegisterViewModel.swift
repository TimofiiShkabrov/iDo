//
//  RegisterViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMassage = ""
    @Published var showRegisterView = false
    @Published var showingAlert = false
    
    init() {}
    
    func createUser() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("Error creating user: \(error)")
                self?.errorMassage = error.localizedDescription
                self?.showingAlert = true
                return
            }
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = UserModel(
            id: id,
            name: name,
            email: email,
            joinDate: Date().timeIntervalSince1970
        )
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) { error in
                if let error = error {
                    print("Error saving user to Firestore: \(error)")
                    self.errorMassage = error.localizedDescription
                    self.showingAlert = true
                } else {
                    self.showRegisterView = false
                }
            }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMassage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMassage = "Enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMassage = "Enter a valid password"
            return false
        }
        return true
    }
}
