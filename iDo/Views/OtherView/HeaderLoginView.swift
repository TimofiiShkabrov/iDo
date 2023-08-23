//
//  HeaderLoginView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 07.08.2023.
//

import SwiftUI

struct HeaderLoginView: View {
    var body: some View {
        ZStack {
            Image("lcbg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                .cornerRadius(20)
                .padding(.top, -UIScreen.main.bounds.height / 1.5)
                .opacity(0.5)
            VStack {
                HStack {
                    Image("logo-png")
                        .resizable()
                        .shadow(color: .white.opacity(0.5), radius: 7)
                        .frame(width: 35, height: 35)
                    Text("iDO")
                        .font(.system(size: 50))
                }
                Text("Turn your ideas into action!")
                    .fontWeight(.light)
            }
            .padding(.bottom, UIScreen.main.bounds.height / 1.7)
        }
    }
}

struct HeaderLoginView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderLoginView()
    }
}
