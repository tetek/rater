//
//  RaterSettings.swift
//  rater
//
//  Created by Wojciech Mandrysz on 14/10/15.
//  Copyright © 2015 Binarka. All rights reserved.
//
import CoreGraphics

struct RaterSettings {
    var minValue            : CGFloat = 0
    var maxValue            : CGFloat = 5
    var step                : CGFloat = 0.1
    var bigStep             : Int = 10 // number of steps to display bigstep
    
    var thickLine           : CGFloat = 6
    var thickLineWidth      : CGFloat = 40
    var skinLine            : CGFloat = 2
    var skinLineWidth       : CGFloat = 20
    var separator           : CGFloat = 12
    var baseColor           : (CGFloat,CGFloat,CGFloat) = (1,0,0.5)
    
    func numberOfSteps() -> Int {
        return Int(fabs(maxValue-minValue) / step) + 1
    }
    func calculateHeight() -> CGFloat {
        return CGFloat(numberOfSteps()) * separator - (separator - thickLine)
    }
}