//
//  NotificationController.swift
//  iStaySafe
//
//  Created by Z Xiao on 3/28/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func scheduleReminders(title: String, body: String, delay: Double, id: String, repeats: Bool) {
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [id])
        
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
           
        // Create the trigger as a repeating event.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delay, repeats: repeats)
        
        // Create the request
        let request = UNNotificationRequest(identifier: id,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
        notificationCenter.add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
    }
}
