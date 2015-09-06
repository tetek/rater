//
//  RulerView.swift
//  rater
//
//  Created by Wojciech Mandrysz on 02/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class RulerView: UIView {

    var minValue : CGFloat = 0
    var maxValue : CGFloat = 5
    var step : CGFloat = 0.1
    var bigStep : Int = 10 // number of steps to display bigstep
//    public var
    var thickLine : CGFloat = 6
    var thickLineWidth : CGFloat = 40
    var skinLine : CGFloat = 2
    var skinLineWidth :CGFloat = 20
    var separator : CGFloat = 12
    
    func numberOfSteps() -> Int{
        return Int(fabs(maxValue-minValue) / step) + 1
    }
    override func didMoveToSuperview() {
//        separator = self.frame.size.height / CGFloat(numberOfSteps())
        self.backgroundColor = UIColor.clearColor()
    }

    func calculateHeight() -> CGFloat {
    
        return CGFloat(numberOfSteps()) * separator - (separator - thickLine)
    }
    
    override func drawRect(rect: CGRect) {
        let cntx = UIGraphicsGetCurrentContext()
                
        for var i  = 0; i < numberOfSteps(); ++i{
            
            CGContextSetRGBStrokeColor(cntx, 181/255, 181/255, 181/255, 1.0)
            var x : CGFloat
            if i %  bigStep == 0{
                CGContextSetLineWidth(cntx, thickLine)
                x = thickLineWidth
            }
            else{
                CGContextSetLineWidth(cntx, skinLine)
                x =  skinLineWidth
            }

            CGContextMoveToPoint(cntx, 0, 2.0 + CGFloat(i) * separator)
            CGContextAddLineToPoint(cntx, x,2.0 +  CGFloat(i) * separator)


            CGContextStrokePath(cntx)
        }


        super.drawRect(rect)
    }
    
}
