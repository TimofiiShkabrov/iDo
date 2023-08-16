//
//  InfoView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 16.08.2023.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                }
                .padding()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
