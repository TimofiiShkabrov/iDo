//
//  ProfileViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid
        else {
            return
        }
        let dataBase = Firestore.firestore()
        dataBase.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joinDate: data["joinDate"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
