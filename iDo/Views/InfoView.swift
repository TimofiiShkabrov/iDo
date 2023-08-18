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
            ScrollView(.horizontal) {
                HStack {
                    Button {
                        //
                        self.infoViewModel.indexInfo = 0
                        withAnimation {
                            self.infoViewModel.infoShow.toggle()
                        }
                    } label: {
                        Text("FAQ")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color("lightBlueColor"))
                            .cornerRadius(20)
                    }
                    Button {
                        //
                        self.infoViewModel.indexInfo = 1
                        withAnimation {
                            self.infoViewModel.infoShow.toggle()
                        }
                    } label: {
                        Text("Feedback & Support")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color("lightBlueColor"))
                            .cornerRadius(20)
                    }
                    Button {
                        //
                        self.infoViewModel.indexInfo = 2
                        withAnimation {
                            self.infoViewModel.infoShow.toggle()
                        }
                    } label: {
                        Text("Terms of Use")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color("lightBlueColor"))
                            .cornerRadius(20)
                    }
                    Button {
                        //
                        self.infoViewModel.indexInfo = 3
                        withAnimation {
                            self.infoViewModel.infoShow.toggle()
                        }
                    } label: {
                        Text("Privacy Policy")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color("lightBlueColor"))
                            .cornerRadius(20)
                    }
                    
                }
                .scrollIndicators(.visible)
                .padding()
            }
            GeometryReader { _ in
                VStack {
                    if self.infoViewModel.indexInfo == 0 {
                        FAQView()
                    } else if self.infoViewModel.indexInfo == 1 {
                        FeedbackAndSupportView()
                    } else if self.infoViewModel.indexInfo == 2 {
                        TermsOfUseView()
                    } else {
                        PrivacyPolicyView()
                    }
                }
            }
        }
        .background()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
