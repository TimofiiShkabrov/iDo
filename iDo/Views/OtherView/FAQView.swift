//
//  FAQView.swift
//  iDo
//
//  Created by Тимофей Шкабров on 16.08.2023.
//

import SwiftUI

struct FAQView: View {
    
    @State private var isExpanded: [Bool] = [false, false, false, false, false, false, false]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Text("Frequently Asked Questions")
                    Spacer()
                }
                .font(.title)
                .bold()
                .padding()
                
                DisclosureGroup(
                    isExpanded: $isExpanded[0],
                    content: {
                        Text("iDo is a modern task management app designed to help you organize your tasks, plan your day, and achieve your goals with ease. It's a powerful tool to boost your productivity and stay focused on what matters most.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    },
                    label: {
                        Text("What is iDo?")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                )
                
                DisclosureGroup(
                    isExpanded: $isExpanded[1],
                    content: {
                        Text("Getting started with iDo is simple! Just download the app from the App Store or Google Play Store, create an account, and you're ready to start organizing your tasks and goals.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    },
                    label: {
                        Text("How do I get started with iDo?")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                )
                
                DisclosureGroup(
                    isExpanded: $isExpanded[2],
                    content: {
                        Text("Yes, the security of your data is our priority. We use Google servers to store all your data. Your data is securely stored and accessible only to you.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    },
                    label: {
                        Text("Is my data safe and secure?")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                )
                
                DisclosureGroup(
                    isExpanded: $isExpanded[3],
                    content: {
                        Text("Absolutely! iDo offers seamless synchronization across all your devices, including smartphones, tablets, and computers. Your tasks and progress will be available wherever you log in.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    },
                    label: {
                        Text("Can I sync my tasks across devices?")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                )
                
                DisclosureGroup(
                    isExpanded: $isExpanded[4],
                    content: {
                        Text("Creating tasks and to-do lists is easy. Open the app, tap the "+" button, and enter the task details. You can set due dates, priorities, and even receive reminders to stay on track.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    },
                    label: {
                        Text("How do I create tasks?")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                )
                
                DisclosureGroup(
                    isExpanded: $isExpanded[5],
                    content: {
                        Text("Currently, iDo is designed for individual use. However, we're constantly working on new features, and task sharing might be considered in future updates.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    },
                    label: {
                        Text("Can I share tasks with others?")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                )
                
                DisclosureGroup(
                    isExpanded: $isExpanded[6],
                    content: {
                        Text("We value your feedback! You can provide feedback and report issues directly through the app's \"Send Feedback\" option. Alternatively, you can contact our support team through email or our website.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    },
                    label: {
                        Text("How can I provide feedback or report issues?")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                )
                
                Divider()
                
                Text("If you have any more questions or need assistance, feel free to reach out to our support team. We're here to help you make the most of your iDo experience!")
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
