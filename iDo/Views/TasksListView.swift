//
//  TasksListView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TasksListView: View {
    @StateObject var headerTasksListViewModel = HeaderTasksListViewModel()
    @StateObject var tasksListViewModel: TasksListViewModel
    @FirestoreQuery var tasks: [TasksModel]
    
    @State private var shortByDateAdded = true
        
    private let userId: String
    
    init(userId: String) {
        self._tasks = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        self._tasksListViewModel = StateObject(wrappedValue: TasksListViewModel(userId: userId))
        self.userId = userId
    }
    
    var body: some View {
        ZStack {
            VStack {
                HeaderTasksListView(headerTasksListViewModel: headerTasksListViewModel)
                    .ignoresSafeArea()
                    .shadow(radius: 5)
                
                NavigationView {
                    VStack {
                        Button {
                            shortByDateAdded.toggle()
                        } label: {
                            HStack {
                                HStack {
                                    Text("Sort by date added")
                                        .foregroundColor(.white)
                                    Image(systemName: "chevron.right.circle.fill")
                                        .foregroundColor(.white)
                                        .rotationEffect(Angle(degrees: (shortByDateAdded ? 90 : -90)))
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(Color("lightBlueColor").opacity(0.8))
                                .cornerRadius(10)
                                
                                Spacer()
                            }
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        
                        List(tasks.sorted(by: shortByDateAdded ? { $0.createdDate > $1.createdDate } : { $0.createdDate < $1.createdDate })) { item in
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
                                    .foregroundColor(Color("lightBlueColor"))
                                
                            }
                            .padding()
                        }
                    }
                    .sheet(isPresented: $tasksListViewModel.showAddTaskView) {
                        AddTaskView(showAddTaskView: $tasksListViewModel.showAddTaskView)
                            .cornerRadius(50)
                    }
                }
            }
            HStack {
                Spacer()
                VStack {
                    MenuView()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.2)
                        .shadow(radius: 5)
                        .cornerRadius(20)
                        .offset(x: headerTasksListViewModel.showMenu ? UIScreen.main.bounds.width / 3 : UIScreen.main.bounds.width * 1.1)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    
                    Spacer()
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
