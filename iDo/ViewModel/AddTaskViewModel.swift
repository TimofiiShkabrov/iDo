//
//  AddTaskViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class AddTaskViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var description = ""
    @Published var dueDate = Date()
    @Published var dateNotification = Date()
    @Published var showAlert = false
      
    init() {}
    
    func save() {
        guard saveCheck else {
            return
        }
        // get current user id
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model data
        let newId = UUID().uuidString
        let newTask = TasksModel(
            id: newId,
            title: title,
            description: description,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            dateNotification: dateNotification.timeIntervalSince1970,
            done: false
        )
        
        // save model data
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(userId)
            .collection("tasks")
            .document(newId)
            .setData(newTask.asDictionary()) { error in
                if let error = error {
                    print("Firestore write error: \(error.localizedDescription)")
                } else {
                    print("Data successfully written to Firestore.")
                }
            }
    }
    
    var saveCheck: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
