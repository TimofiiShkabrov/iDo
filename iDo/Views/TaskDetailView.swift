//
//  TaskDetailView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 18.08.2023.
//

import SwiftUI

struct TaskDetailView: View {
    
    @StateObject var taskViewModel = TaskViewModel()
    @StateObject var taskDetailViewModel = TaskDetailViewModel()
    @ObservedObject var notificationManager: NotificationManager
    var task: TasksModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    if taskDetailViewModel.editTask {
                        TextField("Enter the name of the task", text: $taskDetailViewModel.editTaskTitle)
                    } else {
                        Text(task.title)
                            .font(.title)
                    }
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
                                
                                Spacer()
                            }
                            .padding(.bottom, 5)
                            
                            if taskDetailViewModel.editTask {
                                TextField("Enter a description of the task", text: $taskDetailViewModel.editTaskDescription)
                            } else {
                                Text(task.description)
                                    .font(.body)
                            }
                        }
                        .padding()
                        .background(Color.cyan.opacity(0.2))
                        .cornerRadius(20)
                        .padding(.bottom, 5)

                        
                        if task.dateNotification != task.createdDate {
                            HStack {
                                Image(systemName: "bell")
                                Text("Notification date:")
                                Text("\(Date(timeIntervalSince1970: task.dateNotification).formatted(date: .abbreviated, time: .shortened))")
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            
                        } else {
                            HStack {
                                Image(systemName: "bell")
                                Text("Notification date not selected")
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                        }
                        
                        VStack {
                            Toggle(isOn:
                                    $notificationManager.showNotificationDatePicker
                                .animation(.spring())
                            ) {
                                Text("Remind yourself of the task")
                                    .bold()
                            }
                            if notificationManager.showNotificationDatePicker {
                                VStack {
                                    DatePicker("Notification date", selection: $notificationManager.dateNotification)
                                    
                                    Button(action: {
                                        //
                                        handleNotifications()
                                    }) {
                                        Text("Remind me")
                                            .foregroundColor(.white)
                                            .frame(width: UIScreen.main.bounds.width / 1.3)
                                            .padding()
                                    }
                                    .background(Color("lightBlueColor"))
                                    .clipShape(Capsule())
                                    .padding(.vertical)
                                    
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        
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
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                            .shadow(radius: 10)
                        if taskDetailViewModel.editTask != true {
                            Button(action: {
                                taskDetailViewModel.editTask = true
                            }) {
                                Image(systemName: "square.and.pencil.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color("lightBlueColor"))
                            }
                            .padding()
                        } else {
                            Button(action: {
                                taskDetailViewModel.updateTitle(task: task)
                                taskDetailViewModel.updateDescription(task: task)
                                taskDetailViewModel.editTask = false
                            }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color("lightBlueColor"))
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding()
            .padding(.trailing, 70)
        }
    }
    
    func handleNotifications() {
        if notificationManager.showNotificationDatePicker {
            notificationManager.requestPermission()
            notificationManager.scheduleNotification()
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(notificationManager: NotificationManager(), task: TasksModel(id: "123", title: "Sample Task", description: "Sample Description", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, dateNotification: Date().timeIntervalSince1970, done: false))
    }
}
