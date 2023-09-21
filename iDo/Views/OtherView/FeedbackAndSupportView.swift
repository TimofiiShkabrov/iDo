//
//  FeedbackAndSupportView  .swift
//  iDo
//
//  Created by Тимофей Шкабров on 16.08.2023.
//

import SwiftUI

struct FeedbackAndSupportView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Feedback and Support")
                    Spacer()
                }
                .font(.title)
                .bold()
                .padding()
                Group {
                    Text("  We value your feedback and are here to provide you with the best possible support for your iDo experience. If you have any questions, suggestions, or encounter any issues while using the iDo app, please feel free to reach out to us. Your feedback helps us enhance the app and create a better user experience for you.")
                        .padding()
                    
                    Text("  Contact Us")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    Text("  You can contact us through the following channels:")
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    Text(" · Email: timofii.shkabrov@gmail.com")
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                    Text(" · Website: ido.timlab.online")
                        .padding(.horizontal)
                        .padding(.bottom)
                    Text("  Before reaching out, you might want to check our Frequently Asked Questions (FAQs) section on our website. You might find the answer to your question there.")
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct FeedbackAndSupportView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackAndSupportView()
    }
}
