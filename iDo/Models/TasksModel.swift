//
//  TasksModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation

struct TasksModel: Codable, Identifiable {
    let id: String
    var title: String
    var description: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var dateNotification: TimeInterval
    var done: Bool
    
    mutating func setDone(_ state: Bool) {
        done = state
    }
    
    mutating func setDescription(_ state: String) {
        description = state
    }
    
    mutating func setTitle(_ state: String) {
        title = state
    }
}
