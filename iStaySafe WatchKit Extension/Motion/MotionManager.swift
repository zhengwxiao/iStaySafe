//
//  MotionManager.swift
//  iStaySafe WatchKit Extension
//
//  Created by Z Xiao on 3/28/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import Foundation
import CoreMotion

class MotionManager {
    let motionManager = CMMotionManager()
    
    func start() {
        if self.motionManager.isDeviceMotionAvailable {
            self.motionManager.deviceMotionUpdateInterval = 1.0 / 30.0
            
            var deviceMotion = Array(repeating: 0.0, count: 6)
            
            let deviceMotionHandler: CMDeviceMotionHandler = {
                (data, error) in
                
                guard let data = data else { fatalError("Unable to obtain motion data.") }
                
                deviceMotion[0] = data.userAcceleration.x
                deviceMotion[1] = data.userAcceleration.y
                deviceMotion[2] = data.userAcceleration.z
                deviceMotion[3] = data.rotationRate.x
                deviceMotion[4] = data.rotationRate.y
                deviceMotion[5] = data.rotationRate.z
            }
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue(), withHandler: deviceMotionHandler)
        }
    }
}
