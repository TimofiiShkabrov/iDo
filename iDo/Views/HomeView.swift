//
//  ContentView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var addTaskViewModel = AddTaskViewModel()
    @StateObject var headerTasksListViewModel = HeaderTasksListViewModel()
    
    @State var index = 0
    @State var show = false
    
    var body: some View {
        if homeViewModel.isSignedIn, !homeViewModel.currenUserId.isEmpty {
            
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                            Image("logo-png")
                                .resizable()
                                .frame(width: 35, height: 35)
                            
                            Text("iDO")
                                .font(.title)
                                .bold()
                        }
                        .padding(.bottom, 50)
                        
                        Button {
                            // activate Information
                            self.index = 0
                            withAnimation {
                                self.show.toggle()
                            }
                        } label: {
                            Image(systemName: "text.line.first.and.arrowtriangle.forward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("lightBlueColor"))
                            Text("My tasks")
                                .font(.title)
                        }
                        
                        Divider()
                        
                        Button {
                            // activate addTaskView
                            self.index = 1
                            withAnimation {
                                self.show.toggle()
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("lightBlueColor"))
                            Text("Add new task")
                                .font(.title)
                            
                        }
                        
                        Divider()
                        
                        Button {
                            // activate Profile
                            self.index = 2
                            withAnimation {
                                self.show.toggle()
                            }
                        } label: {
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("lightBlueColor"))
                            Text("Profile")
                                .font(.title)
                            
                        }
                        
                        Divider()
                        
                        Button {
                            // activate Information
                            self.index = 3
                            withAnimation {
                                self.show.toggle()
                            }
                        } label: {
                            Image(systemName: "info.bubble")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("lightBlueColor"))
                            Text("Information")
                                .font(.title)
                            
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 50)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                
                VStack {
                    HStack {
                        Button {
                            //
                            withAnimation {
                                self.show.toggle()
                            }
                        } label: {
                            Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(self.show ? Color.red : Color.white)
                        }
                        Text(self.index == 0 ? "My tasks" : (self.index == 1 ? "Add new task" : (self.index == 2 ? "Profile" : "Information")))
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 25)
                    .background(Image("lcbg").resizable().rotationEffect(Angle(degrees: 90)).aspectRatio(contentMode: .fill))
                    
                    GeometryReader { _ in
                        VStack {
                            if self.index == 0 {
                                TasksListView(userId: homeViewModel.currenUserId)
                            } else if self.index == 1 {
                                AddTaskView(showAddTaskView: $addTaskViewModel.showAddTaskView)
                            } else if self.index == 2 {
                                ProfileView()
                            } else {
                                Text("Information")
                            }
                        }
                    }
                }
                .padding(.top, 50)
                .cornerRadius(self.show ? 20 : 0)
                .scaleEffect(self.show ? 0.8 : 1)
                .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0)
            }
            .ignoresSafeArea(edges: .top)

        } else {
            LoginView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
