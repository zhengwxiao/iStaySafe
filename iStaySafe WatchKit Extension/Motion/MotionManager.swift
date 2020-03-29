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
    
    func startDeviceMotionUpdates() {
        if self.motionManager.isDeviceMotionAvailable {
            self.motionManager.deviceMotionUpdateInterval = 1.0
            
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
                
                print("Acceleration: \(deviceMotion[0]), \(deviceMotion[1]), \(deviceMotion[2])")
                print("Rotation: \(deviceMotion[3]), \(deviceMotion[4]), \(deviceMotion[5])")
            }
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue(), withHandler: deviceMotionHandler)
        }
    }
    
    func stopDeviceMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
}
