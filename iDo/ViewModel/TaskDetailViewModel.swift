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
    @Published var editDateNotification = Date().timeIntervalSince1970
    
    init() {}
    
    func updateTitle(task: TasksModel) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        guard validateTitle() else {
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
                    print("Title updated successfully")
                }
            }
    }
    
    func updateDescription(task: TasksModel) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        guard validateDescription() else {
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
                    print("Description updated successfully")
                }
            }
    }
    
    func updateDateNotification(task: TasksModel) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        guard validateDateNotification() else {
            return
        }
        
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(userId)
            .collection("tasks")
            .document(task.id)
            .updateData(["dateNotification": editDateNotification]) { error in
                if let error = error {
                    print("Error while updating data: \(error.localizedDescription)")
                } else {
                    print("DateNotification updated successfully")
                }
            }
    }
    
    private func validateDateNotification() -> Bool {
        guard editDateNotification > Date().timeIntervalSince1970 else {
            return false
        }
        return true
    }
    
    private func validateTitle () -> Bool {
        guard !editTaskTitle.isEmpty else {
            return false
        }
        return true
    }
    
    private func validateDescription () -> Bool {
        guard !editTaskDescription.isEmpty else {
            return false
        }
        return true
    }
}
