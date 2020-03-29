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
            self.motionManager.deviceMotionUpdateInterval = 1.0 / 50.0
            
            let deviceMotionHandler: CMDeviceMotionHandler = {
                (data, error) in
                
                guard let data = data else { fatalError("Unable to obtain motion data.") }
                
                self.deviceMotion[0] = data.userAcceleration.x * 100
                self.deviceMotion[1] = data.userAcceleration.y * 100
                self.deviceMotion[2] = data.userAcceleration.z * 100
                self.deviceMotion[3] = data.rotationRate.x * 100
                self.deviceMotion[4] = data.rotationRate.y * 100
                self.deviceMotion[5] = data.rotationRate.z * 100
                
                print("Acceleration\nx: \(self.deviceMotion[0])\ny: \(self.deviceMotion[1])\nz: \(self.deviceMotion[2])")
                print("Rotation\nx: \(self.deviceMotion[3])\ny: \(self.deviceMotion[4])\nz: \(self.deviceMotion[5])")
                
                self.detectFaceTouch(deviceMotion: self.deviceMotion)
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
    
    private func detectFaceTouch(deviceMotion: [Double]) {
        if deviceMotion[0] < -0.1 && deviceMotion[0] > -0.03 {
            if deviceMotion[1] < -0.01 && deviceMotion[1] > -0.001 {
                if deviceMotion[2] < -0.1 && deviceMotion[2] > -0.002 {
                    print("Don't touch your face!")
                }
            }
        }
    }
}
