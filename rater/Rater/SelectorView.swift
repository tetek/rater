//
//  SelectorView.swift
//  rater
//
//  Created by Wojciech Mandrysz on 06/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class SelectorView: UIView {
    
    var label       : UILabel!
    var settings    : RaterSettings = RaterSettings()
    var percent     : CGFloat = 0.0
    var text        : String?
    override func didMoveToSuperview() {
        self.backgroundColor = UIColor.clearColor()
        label = UILabel(frame: CGRectMake(140, self.bounds.height/2.0 - 25, 100, 50))
        label.font = UIFont.systemFontOfSize(30)
        label.text = text
        label.textColor = UIColor.blackColor()
        self.addSubview(label)
        self.userInteractionEnabled = false
        
    }
    override func drawRect(rect: CGRect) {
        let cntx = UIGraphicsGetCurrentContext()
        cntx?.drawSmileFace(CGPointMake(settings.thickLineWidth*1.5 + 40, self.frame.size.height/2.0), percent: percent, settings: settings)
        cntx?.drawCentralLine(CGPointMake(0, self.frame.size.height/2.0), percent: percent, settings: settings)
        super.drawRect(rect)
    }
    
    func updateValue(value: CGFloat){
        text = String(format: "%.1f", value)
        if label != nil {
            label.text = text
        }
        percent = value/(CGFloat.abs(settings.minValue) + CGFloat.abs(settings.maxValue))
        setNeedsDisplay()
    }
}
