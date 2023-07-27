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
            }
            .navigationTitle("Yor task")
            .toolbar {
                Button {
                    // add new task
                    tasksListViewModel.showAddTaskView = true
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            .sheet(isPresented: $tasksListViewModel.showAddTaskView) {
                AddTaskView(addTaskPresented: $tasksListViewModel.showAddTaskView)
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView(userId: "TwVUkReS29YXmpr3gHsUcZvcQ002")
    }
}
