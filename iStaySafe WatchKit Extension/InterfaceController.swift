//
//  InterfaceController.swift
//  iStaySafe WatchKit Extension
//
//  Created by Z Xiao on 3/28/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class InterfaceController: WKInterfaceController {
    let extensionDelegate = WKExtension.shared().delegate as? ExtensionDelegate
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func startDetection() {
        extensionDelegate?.motionManager.startDeviceMotionUpdates()
    }
    
    @IBAction func stopDetection() {
        extensionDelegate?.motionManager.stopDeviceMotionUpdates()
    }
    
    @IBAction func setTimer() {
        extensionDelegate?.notificationManager.scheduleReminders(title: "Hand Washing Timer Has Ended", body: "", delay: 20, id: "HandWash")
    }
}
