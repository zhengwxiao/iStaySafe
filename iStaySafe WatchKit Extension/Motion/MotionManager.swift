//
//  MotionManager.swift
//  iStaySafe WatchKit Extension
//
//  Created by Z Xiao on 3/28/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import Foundation
import CoreMotion
import CoreML
import WatchKit

// Source: https://medium.com/skafosai/activity-classification-with-create-ml-coreml3-and-skafos-part-2-734f1ea2f6e

struct ModelConstants {
    static let numOfFeatures = 6
    // Must be the same value you used while training
    static let predictionWindowSize = 100
    // Must be the same value you used while training
    static let sensorsUpdateFrequency = 1.0 / 50.0
    static let hiddenInLength = 20
    static let hiddenCellInLength = 200
}

class MotionManager {
    let motionManager = CMMotionManager()
    let faceTouch = FaceTouch()
    let accX = try? MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    let accY = try? MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    let accZ = try? MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    let rotX = try? MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    let rotY = try? MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    let rotZ = try? MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    var currentState = try? MLMultiArray(
        shape: [(ModelConstants.hiddenInLength +
            ModelConstants.hiddenCellInLength) as NSNumber],
        dataType: MLMultiArrayDataType.double)
    var currentIndexInPredictionWindow = 0
    let predictionWindowDataArray = try? MLMultiArray(shape: [1, ModelConstants.predictionWindowSize, ModelConstants.numOfFeatures] as [NSNumber], dataType: MLMultiArrayDataType.double)
    var lastHiddenOutput = try? MLMultiArray(shape: [ModelConstants.hiddenInLength as NSNumber], dataType: MLMultiArrayDataType.double)
    var lastHiddenCellOutput = try? MLMultiArray(shape: [ModelConstants.hiddenCellInLength as NSNumber], dataType: MLMultiArrayDataType.double)
    
    
    func startDeviceMotionUpdates() {
        guard motionManager.isDeviceMotionAvailable else {
            debugPrint("Core Motion Data Unavailable!")
            return
        }
        motionManager.deviceMotionUpdateInterval = ModelConstants.sensorsUpdateFrequency
        motionManager.showsDeviceMovementDisplay = true
        motionManager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            guard let motionData = motionData else { return }
            // Add motion data sample to array
            self.addMotionDataSampleToArray(motionSample: motionData)
        }
    }
    
    func stopDeviceMotionUpdates() {
        currentIndexInPredictionWindow = 0
        motionManager.stopDeviceMotionUpdates()
        currentState = try? MLMultiArray(
            shape: [(ModelConstants.hiddenInLength +
                ModelConstants.hiddenCellInLength) as NSNumber],
            dataType: MLMultiArrayDataType.double)
    }
    
    func addMotionDataSampleToArray(motionSample: CMDeviceMotion) {
        // Using global queue for building prediction array
        DispatchQueue.global().async {
            self.rotX![self.currentIndexInPredictionWindow] = motionSample.rotationRate.x as NSNumber
            self.rotY![self.currentIndexInPredictionWindow] = motionSample.rotationRate.y as NSNumber
            self.rotZ![self.currentIndexInPredictionWindow] = motionSample.rotationRate.z as NSNumber
            self.accX![self.currentIndexInPredictionWindow] = motionSample.userAcceleration.x as NSNumber
            self.accY![self.currentIndexInPredictionWindow] = motionSample.userAcceleration.y as NSNumber
            self.accZ![self.currentIndexInPredictionWindow] = motionSample.userAcceleration.z as NSNumber
            
            // Update prediction array index
            self.currentIndexInPredictionWindow += 1
            
            // If data array is full - execute a prediction
            if (self.currentIndexInPredictionWindow == ModelConstants.predictionWindowSize) {
                if let output = self.activityPrediction() {
                    if output == "Face" {
                        print("Face touch detected")
                        
                        let delegate = WKExtension.shared().delegate as? ExtensionDelegate
                        delegate?.notificationManager.scheduleReminders(title: "Don't Touch Your Face!", body: "", delay: 0.1, id: "FaceTouch", repeats: false)
                    }
                }
                // Start a new prediction window from scratch
                self.currentIndexInPredictionWindow = 0
            }
        }
    }
    
    func activityPrediction() -> String? {
        // Perform prediction
        let modelPrediction = try? faceTouch.prediction(accX: accX!, accY: accY!, accY_1: accZ!, gyroX: rotX!, gyroY: rotY!, gyroZ: rotZ!, stateIn: currentState)
        
        currentState = modelPrediction?.stateOut
        
        return modelPrediction?.label
    }
}
