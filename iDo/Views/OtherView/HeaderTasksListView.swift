//
//  HeaderTasksListView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 07.08.2023.
//

import SwiftUI

struct HeaderTasksListView: View {
    
    @StateObject var headerTasksListViewModel = HeaderTasksListViewModel()
    
    var body: some View {
        ZStack {
            Image("lcbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .cornerRadius(20)
            VStack {
                Spacer()
                HStack {
                    Text("Tasks".uppercased())
                        .foregroundColor(Color.white)
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                    Button(action: {
                        //
                        headerTasksListViewModel.showMenu.toggle()
                    }) {
                        Image(systemName:("line.3.horizontal.circle"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .foregroundColor(Color.white)
                            .padding()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 200)
        }
    }
}

struct HeaderTasksListView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTasksListView()
    }
}
