//
//  ContentView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        if homeViewModel.isSignedIn, !homeViewModel.currenUserId.isEmpty {
            TabView {
                TasksListView(userId: homeViewModel.currenUserId)
                    .badge("!")
                    .tabItem {
                        Label("Tasks", systemImage: "text.line.first.and.arrowtriangle.forward")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
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
