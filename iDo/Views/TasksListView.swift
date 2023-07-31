//
//  TasksListView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TasksListView: View {
    @StateObject var tasksListViewModel: TasksListViewModel
    @FirestoreQuery var tasks: [TasksModel]
    
    private let userId: String
    
    init(userId: String) {
        self._tasks = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        self._tasksListViewModel = StateObject(wrappedValue: TasksListViewModel(userId: userId))
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(tasks) { item in
                    TaskView(task: item)
                        .swipeActions {
                            Button(action: {
                                tasksListViewModel.delete(id: item.id)
                            }) {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                HStack {
                    
                    Spacer()
                    
                    Button {
                        // activate addTaskView
                        tasksListViewModel.showAddTaskView = true
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                    }
                    .padding()
                }
            }
            .navigationTitle("Yor task")
            .sheet(isPresented: $tasksListViewModel.showAddTaskView) {
                AddTaskView(addTaskPresented: $tasksListViewModel.showAddTaskView)
                    .cornerRadius(50)
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView(userId: "TwVUkReS29YXmpr3gHsUcZvcQ002")
    }
}
