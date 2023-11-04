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
                VStack {
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
                }
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                    
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
                    DatePicker("Notification date:", selection: $notificationManager.dateNotification)
                        .padding(.leading, 10)
                }
                
                // Button
                Button(action: {
                    saveTask()
                    handleNotifications()
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .padding()
                }
                .background(Color("lightBlueColor"))
                .clipShape(Capsule())
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .alert(isPresented: $addTaskViewModel.showAlert) {
                Alert(title: Text("Ops!"), message: Text("Please fill in all fields and set a due date no later than today and notification of the task should not be earlier than its creation."))
            }
        }
    }
    func saveTask() {
        if addTaskViewModel.saveCheck {
            addTaskViewModel.save()
            notificationManager.title = addTaskViewModel.title
            self.homeViewModel.indexPage = 4
        } else {
            addTaskViewModel.showAlert = true
        }
    }
    
    func handleNotifications() {
        if notificationManager.showNotificationDatePicker {
            notificationManager.requestPermission()
            if notificationManager.dateNotification >= addTaskViewModel.dueDate {
                notificationManager.scheduleNotification()
            } else {
                addTaskViewModel.showAlert = true
            }
        } else {
            addTaskViewModel.dateNotification = Date()
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(homeViewModel: HomeViewModel())
    }
}
