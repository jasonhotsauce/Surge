//
//  SparseMatrix.swift
//  Surge
//
//  Created by Wenbin Zhang on 1/25/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import Foundation

public struct SparseMatrix<T where T: FloatingPointType, T: FloatLiteralConvertible> {
    var indexes = [Int]()
    var values = [T]()
    var count: Int
    
    public init(vector: [T]) {
        count = 0
        for index in 0...vector.count-1 {
            if vector[index] != 0.0 {
                indexes.append(index)
                values.append(vector[index])
                count++
            }
        }
    }
}

public func dot(matrix1: SparseMatrix<Double>, matrix: SparseMatrix<Double>) -> Double {
    var p1 = 0, p2 = 0, dot = 0.0
    while (p1 < matrix1.count && p2 < matrix.count) {
        let index1 = matrix1.indexes[p1]
        let index2 = matrix.indexes[p2]
        if index1 == index2 {
            dot += matrix1.values[index1] * matrix.values[index2]
            ++p1
            ++p2
        } else if index1 < index2 {
            ++p1
        } else {
            ++p2
        }
    }
    return dot
}

infix operator • {}
public func • (lhs: SparseMatrix<Double>, rhs: SparseMatrix<Double>) -> Double {
    return dot(lhs, matrix: rhs)
}