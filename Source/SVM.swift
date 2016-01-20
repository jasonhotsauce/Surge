//
//  SVM.swift
//  Surge
//
//  Created by Wenbin Zhang on 1/20/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import Foundation

public enum Kernel: String {
    case Linear = "Linear"
    case RBF = "rbf"
    
    public func calculateKernel(x1: [Double], x2: [Double]) -> Double {
        switch self {
        case .Linear:
            return linearKernel(x1, x2: x2)
        case .RBF:
            return RBFKernel(x1, x2: x2)
        }
    }
    
    private func linearKernel(x1: [Double], x2: [Double]) -> Double {
        return dot(x1, y: x2)
    }
    
    private func RBFKernel(x1: [Double], x2: [Double]) -> Double {
        
    }
}

public struct svm {
    var trainingSamples: Matrix<Double>
    var trainingOutputs: Matrix<Double>
    var C: Float = 0.0
    var threshold: Float = 0.0001
    var kernal: Kernel = .Linear
    var eCache: [Double]
    var alphas: [Double]
    var numOfClasses: Int
    
    public init(trainingSamples: Matrix<Double>, trainingOutputs: Matrix<Double>, C: Float, threshold: Float, numOfClasses: Int) {
        assert(trainingSamples.rows != trainingOutputs.rows)
        self.trainingSamples = trainingSamples
        self.trainingOutputs = trainingOutputs
        self.C = C
        self.threshold = threshold
        self.numOfClasses = numOfClasses
        eCache = [Double](count: trainingOutputs.rows, repeatedValue: 0.0)
        alphas = [Double](count: trainingSamples.rows, repeatedValue: 0.0)
    }
    
    private func calculateKernal(x1: [Double], x2: [Double]) -> Double {
        switch kernal {
        case .Linear:
            
            break
            
        }
    }
}