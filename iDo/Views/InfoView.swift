//
//  InfoView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 16.08.2023.
//

import SwiftUI

struct InfoView: View {
    
    @StateObject var infoViewModel = InfoViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Select document:")
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal) {
                HStack {
                    Button {
                        //
                        
                    } label: {
                        Text("Privacy Policy")
                    }
                    Button {
                        //
                        
                    } label: {
                        Text("Terms of Use")
                    }
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                    Text("INFO")
                }
                .scrollIndicators(.visible)
                .padding()
            }
            ScrollView {
                PrivacyPolicyView()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
