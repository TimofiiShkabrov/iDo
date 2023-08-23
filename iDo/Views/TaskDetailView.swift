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
            .padding()
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "calendar.badge.exclamationmark")
                        Text("Deadline:")
                        Text("\(Date(timeIntervalSince1970: task.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "text.bubble")
                            Text("Task description:")
                        }
                        .padding(.bottom, 5)
                        
                        Text(task.description)
                            .font(.body)
                    }
                    .padding()
                    .background(Color.cyan.opacity(0.3))
                    .cornerRadius(20)
                                            
                    HStack {
                        Image(systemName: "bell")
                        Text("Notification date:")
                        Text("\(Date(timeIntervalSince1970: task.dateNotification).formatted(date: .abbreviated, time: .shortened))")
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                        Text("Date of creation:")
                        Text("\(Date(timeIntervalSince1970: task.createdDate).formatted(date: .abbreviated, time: .shortened))")
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: TasksModel(id: "123", title: "Sample Task", description: "Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, dateNotification: Date().timeIntervalSince1970, done: false))
    }
}
