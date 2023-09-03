//
//  TaskDetailViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 02.09.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TaskDetailViewModel: ObservableObject {
    
    @Published var editTaskDescription = ""
    @Published var editTaskTitle = ""
    @Published var editTask = false

    
    init() {}
    
    func updateDescription(task: TasksModel) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(userId)
            .collection("tasks")
            .document(task.id)
            .updateData(["description": editTaskDescription]) { error in
                if let error = error {
                    print("Error while updating data: \(error.localizedDescription)")
                } else {
                    print("Data updated successfully")
                }
            }
    }
    
    func updateTitle(task: TasksModel) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(userId)
            .collection("tasks")
            .document(task.id)
            .updateData(["title": editTaskTitle]) { error in
                if let error = error {
                    print("Error while updating data: \(error.localizedDescription)")
                } else {
                    print("Data updated successfully")
                }
            }
    }
}
