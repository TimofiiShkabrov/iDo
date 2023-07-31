//
//  SwipeBottomView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 29.07.2023.
//

import SwiftUI

struct SwipeButtonView: View {
    
    private let lightBlueColor = #colorLiteral(red: 0.4470588235, green: 0.4431372549, blue: 0.9882352941, alpha: 1)
    
    var body: some View {
        
        Color(lightBlueColor)
            .clipShape(Capsule())
            .opacity(0.5)
            .frame(width: 200, height: 8)
            .padding()
        
    }
}

struct SwipeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeButtonView()
    }
}
