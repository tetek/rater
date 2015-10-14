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
    let settings : RaterSettings
    var percent : CGFloat = 0.0
    // Init
    init (settings: RaterSettings) {
        self.settings = settings
        super.init(frame: CGRectZero)
    }
    required init?(coder aDecoder: NSCoder) {
        self.settings = RaterSettings()
        super.init(coder: aDecoder)
    }
    
    override func didMoveToSuperview() {
        self.backgroundColor = UIColor.clearColor()
        label = UILabel(frame: CGRectMake(150, 0, 100, 50))
        label.font = UIFont.systemFontOfSize(30)
        label.textColor = UIColor.grayColor()
        label.text = "2.3/5"
        self.addSubview(label)
        self.userInteractionEnabled = false
        
    }
    override func drawRect(rect: CGRect) {
        let cntx = UIGraphicsGetCurrentContext()
        cntx?.drawSmileFace(CGPointMake(110, self.frame.size.height/2.0), percent: percent, settings: settings)
        cntx?.drawCentralLine(CGPointMake(0, self.frame.size.height/2.0), percent: percent, settings: settings)
        super.drawRect(rect)
    }
    
    func updateValue(value: CGFloat){
        if label != nil{
            label.text = String(format: "%.1f", value)
        }

        percent = value/(CGFloat.abs(settings.minValue) + CGFloat.abs(settings.maxValue))
        setNeedsDisplay()
        
    }
}
