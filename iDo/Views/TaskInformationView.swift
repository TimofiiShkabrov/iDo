//
//  TaskInformationView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 05.08.2023.
//

import SwiftUI

struct TaskInformationView: View {
    
    @StateObject var taskViewModel = TaskViewModel()
    let task: TasksModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        taskViewModel.taskDone(task: task)
                    }) {
                        Image(systemName: task.done ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.done ? Color.green : Color.red)
                        Text(task.title)
                            .font(.title)
                        .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
                
                Text("Description task description task description task description task description task description task description task description task description task description task description task description task description task description task description task")
                    .padding()
                
                HStack {
                    Text("\(Date(timeIntervalSince1970: task.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.subheadline)
                    .opacity(0.5)
                }
                .padding(.horizontal)
            }
                
        }
    }
}

struct TaskInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInformationView(task: .init(id: "123", title: "title", description: "description", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, done: true))
    }
}
