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
    private var deviceMotion = Array(repeating: 0.0, count: 6)
    
    func startDeviceMotionUpdates() {
        if self.motionManager.isDeviceMotionAvailable {
            self.motionManager.deviceMotionUpdateInterval = 1.0
            
            let deviceMotionHandler: CMDeviceMotionHandler = {
                (data, error) in
                
                guard let data = data else { fatalError("Unable to obtain motion data.") }
                
                self.deviceMotion[0] = data.userAcceleration.x
                self.deviceMotion[1] = data.userAcceleration.y
                self.deviceMotion[2] = data.userAcceleration.z
                self.deviceMotion[3] = data.rotationRate.x
                self.deviceMotion[4] = data.rotationRate.y
                self.deviceMotion[5] = data.rotationRate.z
                
//                print("Acceleration: \(self.deviceMotion[0]), \(self.deviceMotion[1]), \(self.deviceMotion[2])")
//                print("Rotation: \(self.deviceMotion[3]), \(self.deviceMotion[4]), \(self.deviceMotion[5])")
            }
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue(), withHandler: deviceMotionHandler)
        }
    }
    
    func stopDeviceMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
    
    func deviceMotionData() -> [Double] {
        return deviceMotion
    }
}
