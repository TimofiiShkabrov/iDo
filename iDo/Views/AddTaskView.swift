//
//  AddTaskView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @StateObject var addTaskViewModel = AddTaskViewModel()
    @Binding var showAddTaskView: Bool
    @StateObject var notificationManager = NotificationManager()
    @State var showNotificationDatePicker = false
    
    private let lightBlueColor = #colorLiteral(red: 0.4470588235, green: 0.4431372549, blue: 0.9882352941, alpha: 1)
    
    var body: some View {
        VStack {
            
            HStack {
                SwipeButtonView()
            }
            .padding()
            
            Text("New task")
                .font(.system(size: 32))
                .bold()
                .padding(.top)
            
            Form {
                //Title
                TextField("Enter the task name", text: $addTaskViewModel.title)
                
                    .textFieldStyle(DefaultTextFieldStyle())
                    .font(.system(size: 25))
                    .padding(10)
                
                //Do date
                DatePicker("Due date", selection: $addTaskViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Notification Date
                Toggle(isOn: $showNotificationDatePicker) {
                    Text("Remind yourself of the task")
                        .padding(10)
                        .bold()
                }
                
                if showNotificationDatePicker { 
                    DatePicker("Notification date", selection: $notificationManager.dateNotification)
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
                
                // Button
                Button(action: {
                    if addTaskViewModel.saveCheck {
                        addTaskViewModel.save()
                        notificationManager.title = addTaskViewModel.title
                        showAddTaskView = false
                    } else {
                        addTaskViewModel.showAlert = true
                    }
                    if showNotificationDatePicker {
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
                .background(Color(lightBlueColor))
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
        AddTaskView(showAddTaskView: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
