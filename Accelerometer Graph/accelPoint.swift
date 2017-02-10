//
//  accelPoint.swift
//  Accelerometer Graph
//
//  Created by Alex Gubbay on 08/12/2016.
//  Copyright © 2016 Alex Gubbay. All rights reserved.
//

import Foundation

class accelPoint {
    
    
    var x = 0.0
    var y = 0.0
    var z = 0.0
    var count = 0
    init(dataX: Double, dataY: Double, dataZ: Double, count: Int) {
        

        self.x = dataX
        self.y = dataY
        self.z = dataZ
        self.count = count
        
    }
    
    init() {
        
        self.x = 0
        self.y = 0
        self.z = 0
        self.count = 0
        
    }
    
    
    func getAbs() -> Double{
        return x
    }
    
    func getAxis(axis: String) -> Double{
        
        switch axis {
        case "x":
            return x
        case "y":
            return y
        case "z":
            return z
        default:
            return x
        }
        
    }
}
