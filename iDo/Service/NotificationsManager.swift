//
//  NotificationsManager.swift
//  iDo
//
//  Created by Тимофей Шкабров on 03.08.2023.
//

import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
    
    @Published var title = ""
    @Published var dateNotification = Date()
    @Published var showNotificationDatePicker = false

    init() {}
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder of the task"
        content.subtitle = title
        content.sound = UNNotificationSound.default
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateNotification)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

