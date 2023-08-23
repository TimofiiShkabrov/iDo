//
//  AddTaskView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @StateObject var addTaskViewModel = AddTaskViewModel()
    @StateObject var notificationManager = NotificationManager()
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Form {
                //Title
                TextField("Enter the task name", text: $addTaskViewModel.title, axis: .vertical)
                    .lineLimit(nil)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .font(.system(size: 25))
                    .padding(10)
                
                //Description
                TextField("Enter a description for the task", text: $addTaskViewModel.description, axis: .vertical)
                    .lineLimit(nil)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .font(.system(size: 18))
                    .padding(10)
                
                //Do date
                DatePicker("Due date", selection: $addTaskViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Notification Date
                Toggle(isOn:
                        $notificationManager.showNotificationDatePicker
                    .animation(.spring())
                ) {
                    Text("Remind yourself of the task")
                        .padding(10)
                        .bold()
                }
                
                if notificationManager.showNotificationDatePicker {
                    DatePicker("Notification date", selection: $notificationManager.dateNotification)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                
                // Button
                Button(action: {
                    if addTaskViewModel.saveCheck {
                        addTaskViewModel.save()
                        notificationManager.title = addTaskViewModel.title
                        self.homeViewModel.indexPage = 4
                    } else {
                        addTaskViewModel.showAlert = true
                    }
                    if notificationManager.showNotificationDatePicker {
                        notificationManager.requestPermission()
                        if notificationManager.dateNotification != addTaskViewModel.dueDate {
                            notificationManager.scheduleNotification()
                        } else {
                            addTaskViewModel.showAlert = true
                        }
                    }
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .padding()
                }
                .background(Color("lightBlueColor"))
                .clipShape(Capsule())
            }
            .alert(isPresented: $addTaskViewModel.showAlert) {
                Alert(title: Text("Ops!"), message: Text("Please fill in all fields and set a due date no later than today and notification of the task should not be earlier than its creation."))
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(homeViewModel: HomeViewModel())
    }
}
