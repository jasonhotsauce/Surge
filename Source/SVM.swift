//
//  SVM.swift
//  Surge
//
//  Created by Wenbin Zhang on 1/20/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import Foundation

public enum KernelType: String {
    case Linear = "Linear"
    case RBF = "rbf"
}

public struct Kernel {
    var type: KernelType
    var sigma: Double
    
    init() {
        type = .Linear
        sigma = 0.0
    }
    
    init(param: Double) {
        type = .RBF
        sigma = param
    }
    
    public func calculateKernel(x1: [Double], x2: [Double]) -> Double {
        switch type {
        case .Linear:
            return linearKernel(x1, x2: x2)
        case .RBF:
            return RBFKernel(x1, x2: x2, sigma: sigma)
        }
    }
    
    private func linearKernel(x1: [Double], x2: [Double]) -> Double {
        return dot(x1, y: x2)
    }
    
    private func RBFKernel(x1: [Double], x2: [Double], sigma: Double) -> Double {
        return exp(-1 * pow(dist(x1, y: x2), 2) / 2 * pow(sigma, 2))
    }
}

public struct SVM<T where T: FloatingPointType, T: FloatLiteralConvertible> {
    
    var trainingSamples: Matrix<T>
    var trainingOutputs: [T]
    var C: T = 0.0
    var threshold: T = 0.0001
    var kernal: Kernel = Kernel()
    var eCache: [T]
    var alphas: [T]
    var numOfClasses: Int
    
    public init(trainingSamples: Matrix<T>, trainingOutputs: [T], C: T, threshold: T, numOfClasses: Int) {
        precondition(trainingSamples.rows != trainingOutputs.count, "training data set and output label must have the same amound.")
        self.trainingSamples = trainingSamples
        self.trainingOutputs = trainingOutputs
        self.C = C
        self.threshold = threshold
        self.numOfClasses = numOfClasses
        eCache = [T](count: trainingSamples.rows, repeatedValue: 0.0)
        alphas = [T](count: trainingSamples.rows, repeatedValue: 0.0)
    }
    
    private func clipValue(value: T, max: T, min: T) -> T {
        if value > max {
            return max;
        } else if value < min {
            return min;
        } else {
            return value;
        }
    }
    
    private func calculateAndUpdateError(err1: T, err2: T) {
        
    }
    
    public func train(maxIteration: Int) {
        var currentIteration = 0;
        while (currentIteration < maxIteration) {
            
            currentIteration++;
        }
    }
}