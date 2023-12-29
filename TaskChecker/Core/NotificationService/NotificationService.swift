//
//  NotificationService.swift
//  TaskChecker
//
//  Created by admin on 27.12.2023.
//

import UserNotifications
import UIKit

class NotificationService {
    static let shared = NotificationService()
    private init() {}
    
    static func permission() {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
        }
    }
    
    func setReminder(_ date: Date, subtitle: String, isRepeat: Bool, identifier: String) {
        let calendar = Calendar.current
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current

        dateComponents.hour = calendar.component(.hour, from: date)
        dateComponents.minute = calendar.component(.minute, from: date)
        dateComponents.day = calendar.component(.day, from: date)
        dateComponents.month = calendar.component(.month, from: date)
        dateComponents.year = calendar.component(.year, from: date)

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isRepeat)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
    
    func removeNotification(identifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
//    static func requestReviewManually() {
//      // TODO: replace xxxxxxxxxx in the following URL with your Apps Apple ID
//      let url = "https://apps.apple.com/app/id1637899703?action=write-review"
//      guard let writeReviewURL = URL(string: url)
//          else { fatalError("Expected a valid URL") }
//      UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
//    }
}
