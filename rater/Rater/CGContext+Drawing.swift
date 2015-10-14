//
//  CGContext-Drawing.swift
//  rater
//
//  Created by Wojciech Mandrysz on 14/10/15.
//  Copyright © 2015 Binarka. All rights reserved.
//
import UIKit

extension CGContext {
    
    func drawSmileFace(anchor: CGPoint, percent: CGFloat, settings: RaterSettings) {
        let y = anchor.y
        CGContextSetRGBStrokeColor(self, settings.baseColor.0 - percent, percent, settings.baseColor.2, 1.0)
        CGContextSetLineWidth(self, 3)
        CGContextAddArc(self, anchor.x, y, 25 , 0, CGFloat(M_PI*2), 1)
        CGContextMoveToPoint(self, anchor.x-25, y)
        let curveStrength : CGFloat = 40.0
        let point = curveStrength * percent
        CGContextAddCurveToPoint(self, anchor.x-25, y, anchor.x, y - curveStrength/2.0 + point, anchor.x + 20, y)
        CGContextStrokePath(self)
    }
    
    func drawCentralLine(anchor: CGPoint, percent: CGFloat, settings: RaterSettings){
        let y = anchor.y
        CGContextSetRGBStrokeColor(self, settings.baseColor.0 - percent, percent, settings.baseColor.2, 1.0)
        CGContextSetLineWidth(self, settings.thickLine)
        CGContextMoveToPoint(self, anchor.x, y)
        CGContextAddLineToPoint(self, settings.thickLineWidth ,y)
        CGContextStrokePath(self)
    }
    
    func drawRuler(settings: RaterSettings) {
        for var i  = 0; i < settings.numberOfSteps(); ++i{
            
            CGContextSetRGBStrokeColor(self, 181/255.0, 181/255.0, 181/255.0, 1.0)
            var x : CGFloat
            if i %  settings.bigStep == 0{
                CGContextSetLineWidth(self, settings.thickLine)
                x = settings.thickLineWidth
            }
            else{
                CGContextSetLineWidth(self, settings.skinLine)
                x =  settings.skinLineWidth
            }
            
            CGContextMoveToPoint(self, 0, settings.thickLine/2.0 + CGFloat(i) * settings.separator)
            CGContextAddLineToPoint(self, x, settings.thickLine/2.0 +  CGFloat(i) * settings.separator)
            CGContextStrokePath(self)
        }
    }
}
