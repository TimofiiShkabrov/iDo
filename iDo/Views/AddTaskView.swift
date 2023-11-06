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
                    VStack {
                        //Title
                        TextField("Enter the task name", text: $addTaskViewModel.title, axis: .vertical)
                            .lineLimit(nil)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.system(size: 25))
                            .padding(10)
                        
                        Divider()
                        
                        //Description
                        TextField("Enter a description for the task", text: $addTaskViewModel.description, axis: .vertical)
                            .lineLimit(nil)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.system(size: 18))
                            .padding(10)
                        
                        Divider()
                    }
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                    
                    //Do date
                    DatePicker("Due date", selection: $addTaskViewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    Divider()
                    
                    //Notification Date
                    Toggle(isOn:
                            $notificationManager.showNotificationDatePicker
                        .animation(.spring())
                    ) {
                        Text("Remind yourself of the task")
                            .padding(10)
                            .bold()
                    }
                    .padding(.trailing, 10)
                    
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
                    .background(notificationManager.showNotificationDatePicker && notificationManager.dateNotification <= Date() ? Color.gray.opacity(0.5) : Color("lightBlueColor"))
                    .clipShape(Capsule())
                }
                .alert(isPresented: $addTaskViewModel.showAlert) {
                    Alert(title: Text("Ops!"), message: Text("Please fill in all fields and set a due date no later than today and notification of the task should not be earlier than its creation."))
                }
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
            if notificationManager.dateNotification >= Date() {
                notificationManager.scheduleNotification()
                addTaskViewModel.dateNotification = notificationManager.dateNotification
            } else {
                addTaskViewModel.showAlert = true
            }
        } else {
            addTaskViewModel.dateNotification = addTaskViewModel.dueDate
            print("No notification date has been selected. Optionally installed: \(addTaskViewModel.dateNotification) from due date: \(addTaskViewModel.dueDate)")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(homeViewModel: HomeViewModel())
    }
}
