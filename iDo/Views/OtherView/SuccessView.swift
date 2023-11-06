//
//  SuccessView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 4.11.23.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image("lcbg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        Text("Done!")
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    SuccessView()
}
