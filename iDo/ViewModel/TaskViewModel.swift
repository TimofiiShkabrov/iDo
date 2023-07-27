//
//  TaskViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TaskViewModel: ObservableObject {
    init() {}
    
    func taskDone(task: TasksModel) {
        var taskDone = task
        taskDone.setDone(!task.done)
        
        guard let uid = Auth.auth().currentUser?.uid
        else {
            return
        }
        
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(uid)
            .collection("tasks")
            .document(taskDone.id)
            .setData(taskDone.asDictionary())
    }
}
