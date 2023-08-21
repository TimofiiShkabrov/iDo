//
//  TasksModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation

struct TasksModel: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    let dateNotification: TimeInterval
    var done: Bool
    
    mutating func setDone(_ state: Bool) {
        done = state
    }
}
