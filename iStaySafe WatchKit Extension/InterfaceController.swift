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
    @IBOutlet weak var accelerationLabel: WKInterfaceLabel!
    @IBOutlet weak var rotationLabel: WKInterfaceLabel!
    private var deviceMotion: [Double] = Array(repeating: 0.0, count: 6)
    
    let extensionDelegate = WKExtension.shared().delegate as? ExtensionDelegate
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                print(request)
            }
        })
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

    @IBAction func captureMotionPressed() {
        let motionManager = extensionDelegate?.motionManager
        deviceMotion = motionManager?.deviceMotionData() as! [Double]
        
        accelerationLabel.setText("Acceleration\nx: \(deviceMotion[0])\ny: \(deviceMotion[1])\nz: \(deviceMotion[2])")
        rotationLabel.setText("Rotation\nx: \(deviceMotion[3])\ny: \(deviceMotion[4])\nz: \(deviceMotion[5])")
        
        print("Acceleration\nx: \(deviceMotion[0])\ny: \(deviceMotion[1])\nz: \(deviceMotion[2])")
        print("Rotation\nx: \(deviceMotion[3])\ny: \(deviceMotion[4])\nz: \(deviceMotion[5])")
    }
}
