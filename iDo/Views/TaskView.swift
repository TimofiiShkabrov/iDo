//
//  TaskView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct TaskView: View {
    
    @StateObject var taskViewModel = TaskViewModel()
    let task: TasksModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    if task.done {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.green)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(Color.red)
                    }
                    Text(task.title)
                        .font(.title2)
                    .padding(.bottom, 5)
                }
                Text("\(Date(timeIntervalSince1970: task.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.subheadline)
                    .opacity(0.5)
            }
            
            Spacer()
            
        }
        .padding(.bottom, 8)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: .init(id: "123", title: "title", description: "description", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, dateNotification: Date().timeIntervalSince1970, done: true))
    }
}
