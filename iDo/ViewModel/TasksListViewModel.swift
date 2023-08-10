//
//  TasksListViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation
import FirebaseFirestore

class TasksListViewModel: ObservableObject {
        
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(userId)
            .collection("tasks")
            .document(id)
            .delete()
    }
}
