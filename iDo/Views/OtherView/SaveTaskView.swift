//
//  SaveTaskView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 21.08.2023.
//

import SwiftUI

struct SaveTaskView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Image("sucsessfull")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    Text("Task saved successfully!")
                        .font(.title3)
                    HStack {
                        Button(action: {
                            //
                            self.homeViewModel.indexPage = 0
                        }) {
                            HStack {
                                Text("Tasks list")
                                Image(systemName: "text.line.first.and.arrowtriangle.forward")
                            }
                            .padding()
                            .foregroundColor(Color.white)
                            
                        }
                        .background(Color("lightBlueColor"))
                        .clipShape(Capsule())
                        
                        Button(action: {
                            //
                            self.homeViewModel.indexPage = 1
                        }) {
                            HStack {
                                Text("New task")
                                Image(systemName: "plus.circle")
                            }
                            .padding()
                            .foregroundColor(Color.white)
                        }
                        .background(Color("lightBlueColor"))
                        .clipShape(Capsule())
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .background()
    }
}

struct SaveTaskView_Previews: PreviewProvider {
    static var previews: some View {
        SaveTaskView(homeViewModel: HomeViewModel())
    }
}
