//
//  iDoApp.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import SwiftUI
import FirebaseCore

@main
struct iDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
