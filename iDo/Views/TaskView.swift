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
                Text(task.title)
                    .font(.body)
                    .padding(.bottom, 5)
                Text("\(Date(timeIntervalSince1970: task.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.subheadline)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Button(action: {
                taskViewModel.taskDone(task: task)
            }) {
                Image(systemName: task.done ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.done ? Color.green : Color.red)
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: .init(id: "123", title: "title", description: "description", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, done: true))
    }
}
