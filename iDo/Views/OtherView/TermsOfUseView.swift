//
//  TermsOfUseView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 16.08.2023.
//

import SwiftUI

struct TermsOfUseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Terms of Use")
                    Spacer()
                }
                .font(.title)
                .bold()
                .padding()
                Group {
                    Text("  Welcome to the \"iDo\" application! By using this application, you agree to comply with this Terms of Use Agreement. If you do not agree with any of the terms, please discontinue use of the application.")
                        .padding()
                    
                    Text("  Registration and Account:")
                        .font(.title3)
                        .padding(.horizontal)
                    Text("  To use the application's features, you are required to create an account. You are responsible for the security of your account and password.")
                        .padding(.horizontal)
                        .padding(.bottom)
                    Text("  Data Usage:")
                        .font(.title3)
                        .padding(.horizontal)
                    Text("  You agree to provide accurate and up-to-date personal data during registration. You also agree that we may use your data in accordance with our Privacy Policy.")
                        .padding(.horizontal)
                        .padding(.bottom)
                    Text("  Intellectual Property:")
                        .font(.title3)
                        .padding(.horizontal)
                    Text("  All rights to intellectual property associated with the \"iDo\" application remain with us. You are responsible for adhering to copyright and other rights when using the application.")
                        .padding(.horizontal)
                        .padding(.bottom)
                    Text("  Prohibitions:")
                        .font(.title3)
                        .padding(.horizontal)
                    Text("  You agree not to violate laws, upload malicious content, or abuse the application's functionality.")
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                Group {
                    Text("  Liability:")
                        .font(.title3)
                        .padding(.horizontal)
                    Text("  We are not responsible for any losses you may incur as a result of using the application.")
                        .padding(.horizontal)
                        .padding(.bottom)
                    Text("  Changes and Updates:")
                        .font(.title3)
                        .padding(.horizontal)
                    Text("  We reserve the right to make changes and updates to the application and the Terms of Use.")
                        .padding(.horizontal)
                        .padding(.bottom)
                    Text("  By agreeing to this Terms of Use, you acknowledge that you have read and understood all of its provisions.")
                        .padding(.horizontal)
                        .padding(.bottom)
                    Text("Effective Date: 16.08.2023")
                        .font(.title3)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct TermsOfUseView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfUseView()
    }
}
