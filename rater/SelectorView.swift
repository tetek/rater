//
//  SelectorView.swift
//  rater
//
//  Created by Wojciech Mandrysz on 06/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class SelectorView: UIView {
    
    var label : UILabel!

    override func didMoveToSuperview() {
        self.backgroundColor = UIColor.clearColor()
        label = UILabel(frame: CGRectMake(100, 0, 100, 50))
        label.font = UIFont.systemFontOfSize(30)
        label.textColor = UIColor.grayColor()
        label.text = "2.3/5"
        self.addSubview(label)
        self.userInteractionEnabled = false
        
    }
    override func drawRect(rect: CGRect) {
        drawCentralLine()
        super.drawRect(rect)
    }
    
    
    func drawCentralLine(){
        let cntx = UIGraphicsGetCurrentContext()
        
        CGContextSetRGBStrokeColor(cntx, 0, 1, 0, 1.0)
        
        CGContextSetLineWidth(cntx, 6)
        CGContextMoveToPoint(cntx, 0, self.frame.size.height/2.0)
        CGContextAddLineToPoint(cntx, 60 ,self.frame.size.height/2.0)
        
        CGContextStrokePath(cntx)
        
    }
    
    func updateValue(value: CGFloat){
        if label != nil{
            label.text = String(format: "%.1f", value)
        }
    }
}
