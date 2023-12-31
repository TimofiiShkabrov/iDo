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
    
    var body: some View {
        if homeViewModel.isSignedIn, !homeViewModel.currenUserId.isEmpty {
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                            Image("logo-png")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("iDO")
                                .font(.system(size: 50, weight: .bold))
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                        
                        Button {
                            // activate Information
                            self.homeViewModel.indexPage = 0
                            withAnimation {
                                self.homeViewModel.showMenu.toggle()
                            }
                        } label: {
                            Image(systemName: "text.line.first.and.arrowtriangle.forward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("lightBlueColor"))
                            Text("Tasks")
                                .font(.title)
                        }
                        
                        Divider()
                        
                        Button {
                            // activate addTaskView
                            self.homeViewModel.indexPage = 1
                            withAnimation {
                                self.homeViewModel.showMenu.toggle()
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("lightBlueColor"))
                            Text("Add")
                                .font(.title)
                            
                        }
                        
                        Divider()
                        
                        Button {
                            // activate Profile
                            self.homeViewModel.indexPage = 2
                            withAnimation {
                                self.homeViewModel.showMenu.toggle()
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
                            self.homeViewModel.indexPage = 3
                            withAnimation {
                                self.homeViewModel.showMenu.toggle()
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
                
                VStack {
                    HStack {
                        Button {
                            //
                            withAnimation {
                                self.homeViewModel.showMenu.toggle()
                            }
                        } label: {
                            Image(systemName: self.homeViewModel.showMenu ? "xmark" : "line.horizontal.3")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(self.homeViewModel.showMenu ? Color.red : Color.white)
                        }
                        Text(self.homeViewModel.indexPage == 0 ? "My tasks" : (self.homeViewModel.indexPage == 1 ? "Add new task" : (self.homeViewModel.indexPage == 2 ? "Profile" : "Information")))
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal, 25)
                    .background(Image("lcbg")
                        .resizable()
                        .opacity(0.5)
                        .rotationEffect(Angle(degrees: 90))
                        .aspectRatio(contentMode: .fill)
                    )
                    .shadow(radius: 20)
                    
                    GeometryReader { _ in
                        VStack {
                            if self.homeViewModel.indexPage == 0 {
                                TasksListView(userId: homeViewModel.currenUserId)
                            } else if self.homeViewModel.indexPage == 1 {
                                AddTaskView(homeViewModel: homeViewModel)
                            } else if self.homeViewModel.indexPage == 2 {
                                ProfileView()
                            } else if self.homeViewModel.indexPage == 3 {
                                InfoView()
                            } else {
                                SaveTaskView(homeViewModel: homeViewModel)
                            }
                        }
                    }
                }
                .background()
                .padding(.top, 50)
                .cornerRadius(self.homeViewModel.showMenu ? 20 : 0)
                .scaleEffect(self.homeViewModel.showMenu ? 0.8 : 1)
                .offset(x: self.homeViewModel.showMenu ? UIScreen.main.bounds.width / 2 : 0)
                
                if self.homeViewModel.indexPage == 0 {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                // activate addTaskView
                                self.homeViewModel.indexPage = 1
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color.white)
                                        .shadow(radius: 10)
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(Color("lightBlueColor"))
                                }
                            }
                        }
                        .padding(30)
                    }
                }
            }
            .ignoresSafeArea()
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
