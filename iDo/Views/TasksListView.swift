//
//  TasksListView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TasksListView: View {
    
    @StateObject var taskViewModel = TaskViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var addTaskViewModel = AddTaskViewModel()
    @StateObject var tasksListViewModel: TasksListViewModel
    @FirestoreQuery var tasks: [TasksModel]
    
    private let userId: String
    
    init(userId: String) {
        self._tasks = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        self._tasksListViewModel = StateObject(wrappedValue: TasksListViewModel(userId: userId))
        self.userId = userId
    }
    
    var body: some View {
        VStack {
            Button {
                tasksListViewModel.shortByDateAdded.toggle()
            } label: {
                HStack {
                    HStack {
                        Text("Sort by date added")
                            .foregroundColor(.white)
                        Image(systemName: "chevron.right.circle.fill")
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: (tasksListViewModel.shortByDateAdded ? 90 : -90)))
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color("lightBlueColor").opacity(0.8))
                    .cornerRadius(10)
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            NavigationView {
                List(tasks.sorted(by: tasksListViewModel.shortByDateAdded ? { $0.createdDate > $1.createdDate } : { $0.createdDate < $1.createdDate })) { item in
                    NavigationLink(destination: TaskDetailView(task: item)) {
                        TaskView(task: item)
                            .swipeActions {
                                Button(action: {
                                    tasksListViewModel.delete(id: item.id)
                                }) {
                                    Text("Delete")
                                }
                                .tint(.red)
                            }
                            .swipeActions(edge: .leading) {
                                Button(action: {
                                    taskViewModel.taskDone(task: item)
                                }) {
                                    Image(systemName: "checkmark.circle.fill")
                                }
                                .tint(.green)
                            }
                    }
                }
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView(userId: "TwVUkReS29YXmpr3gHsUcZvcQ002")
    }
}
