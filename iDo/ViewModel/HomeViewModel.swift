//
//  HomeViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation
import FirebaseAuth

class HomeViewModel: ObservableObject {
    
    @Published var currenUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currenUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
