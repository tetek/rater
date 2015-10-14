//
//  RaterSettings.swift
//  rater
//
//  Created by Wojciech Mandrysz on 14/10/15.
//  Copyright © 2015 Binarka. All rights reserved.
//
import CoreGraphics

struct RaterSettings {
    let minValue            : CGFloat = 0
    let maxValue            : CGFloat = 5
    let step                : CGFloat = 0.1
    let bigStep             : Int = 10 // number of steps to display bigstep
    
    let thickLine           : CGFloat = 6
    let thickLineWidth      : CGFloat = 40
    let skinLine            : CGFloat = 2
    let skinLineWidth       : CGFloat = 20
    let separator           : CGFloat = 12
    let baseColor           : (CGFloat,CGFloat,CGFloat) = (1,0,0.5)
    
    func numberOfSteps() -> Int {
        return Int(fabs(maxValue-minValue) / step) + 1
    }
    func calculateHeight() -> CGFloat {
        return CGFloat(numberOfSteps()) * separator - (separator - thickLine)
    }
}