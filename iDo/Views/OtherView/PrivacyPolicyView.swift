//
//  PrivacyPolicyView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 16.08.2023.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Privacy Policy")
                    Spacer()
                }
                .font(.title)
                .bold()
                .padding()
                Group {
                    Text("  This Privacy Policy describes how we collect, use, and protect your personal data in the \"iDo\" application. We are committed to ensuring your privacy and safeguarding your personal information.")
                        .padding(.vertical)
                    
                    Text("  Data Collection:")
                        .font(.title3)
                    Text("  We may collect information that you provide to us, including your name, email address, password, and other personal data necessary for registration and use of the application.")
                        .padding(.bottom)
                    Text("  Data Usage:")
                        .font(.title3)
                    Text("  We use your personal data to provide you access to the application's functionality, manage your tasks and goals, and send you notifications and reminders related to your tasks.")
                        .padding(.bottom)
                    Text("  Data Protection:")
                        .font(.title3)
                    Text("  We take measures to protect your data from unauthorized access, use, or disclosure. Your personal data is stored on secure servers and transmitted through encrypted channels.")
                        .padding(.bottom)
                    Text("  Data Sharing:")
                        .font(.title3)
                    Text("  We do not sell, rent, or disclose your personal data to third parties without your consent. We may share anonymous and aggregated data for statistical purposes.")
                        .padding(.bottom)
                }
                .padding(.horizontal)
                
                Group {
                    Text("  Policy Changes:")
                        .font(.title3)
                    Text("  We reserve the right to make changes to our Privacy Policy. Changes will be posted on this page.")
                        .padding(.bottom)
                    Text("  Contact:")
                        .font(.title3)
                    Text("  If you have any questions or concerns regarding our Privacy Policy, please contact us at timofii.shkabrov@gmail.com.")
                        .padding(.bottom)
                    Text("Effective Date: 16.08.2023")
                        .font(.title3)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
