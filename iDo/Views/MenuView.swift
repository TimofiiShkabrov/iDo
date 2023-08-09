//
//  MenuView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 08.08.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Button {
                    // activate addTaskView
                    
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("lightBlueColor"))
                    Text("Add new task")
                        .font(.title)
                    
                }
                .padding(.top)
                
                Divider()
                
                Button {
                    // activate addTaskView
                    
                    
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
                    // activate addTaskView
                    
                    
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
            .foregroundColor(Color.white)
            .padding(40)
            
            Spacer()
        }
        .background(Image("lcbg").resizable().aspectRatio(contentMode: .fill).rotationEffect(Angle(degrees: 180)))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
