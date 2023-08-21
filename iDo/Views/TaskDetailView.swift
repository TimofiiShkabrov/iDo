//
//  TaskDetailView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 18.08.2023.
//

import SwiftUI

struct TaskDetailView: View {
    
    @StateObject var taskViewModel = TaskViewModel()
    var task: TasksModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(task.title)
                    .font(.title)
                
                Spacer()
                
                Button(action: {
                    taskViewModel.taskDone(task: task)
                }) {
                    Image(systemName: task.done ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(task.done ? .green : .red))
                }
            }
            .padding(.vertical)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Deadline:")
                        Text("\(Date(timeIntervalSince1970: task.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    }
                    Text("Task description:")
                        .padding(.top)
                        .padding(.bottom, 5)
                    Text(task.description)
                        .font(.body)
                }
            }
            HStack {
                Text("Notification date:")
                Text("\(Date(timeIntervalSince1970: task.dateNotification).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.vertical)
            HStack {
                Text("Date of creation:")
                Text("\(Date(timeIntervalSince1970: task.createdDate).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: TasksModel(id: "123", title: "Sample Task", description: "Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, dateNotification: Date().timeIntervalSince1970, done: false))
    }
}
