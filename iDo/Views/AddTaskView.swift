//
//  AddTaskView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @StateObject var addTaskViewModel = AddTaskViewModel()
    @Binding var addTaskPresented: Bool
    
    var body: some View {
        VStack {
            Text("New task")
                .font(.system(size: 32))
                .bold()
                .padding(.top)
            
            Form {
                //Title
                TextField("Enter task", text: $addTaskViewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .font(.system(size: 25))
                
                //Do date
                DatePicker("Due date", selection: $addTaskViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                Button(action: {
                    if addTaskViewModel.saveCheck {
                        addTaskViewModel.save()
                        addTaskPresented = false
                    } else {
                        addTaskViewModel.showAlert = true
                    }
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .padding()
                }
                .background(Color.green)
                .clipShape(Capsule())
            }
            .alert(isPresented: $addTaskViewModel.showAlert) {
                Alert(title: Text("Ops!"), message: Text("Please fill in all fields and set a due date, no later than today."))
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(addTaskPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
