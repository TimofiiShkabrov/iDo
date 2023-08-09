//
//  HeaderTasksListView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 07.08.2023.
//

import SwiftUI

struct HeaderTasksListView: View {
    
    @StateObject var headerTasksListViewModel: HeaderTasksListViewModel
    
    var body: some View {
        ZStack {
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
                .offset(x: headerTasksListViewModel.showMenu ? -UIScreen.main.bounds.width / 1.35 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))

            }
            .frame(width: UIScreen.main.bounds.width, height: 120)
            .background(Image("lcbg").resizable().aspectRatio(contentMode: .fill))
            .cornerRadius(20)
        }
    }
}

struct HeaderTasksListView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTasksListView(headerTasksListViewModel: HeaderTasksListViewModel())
    }
}
