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
        self.backgroundColor = UIColor.clear
        label = UILabel(frame: CGRect(x: 140, y: self.bounds.height/2.0 - 25, width: 100, height: 50))
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = text
        label.textColor = UIColor.white
        self.addSubview(label)
        self.label.isHidden = true
        self.isUserInteractionEnabled = false
        
    }
    override func draw(_ rect: CGRect) {
        let cntx = UIGraphicsGetCurrentContext()
        cntx?.drawSmileFace(CGPoint(x: settings.thickLineWidth*1.5 + 60, y: self.frame.size.height/2.0), percent: percent, settings: settings)
        cntx?.drawCentralLine(CGPoint(x: 0, y: self.frame.size.height/2.0), percent: percent, settings: settings)
        super.draw(rect)
    }
    
    func updateValue(_ value: CGFloat){
        text = String(format: "%.1f", value)
        if label != nil {
            label.text = text
        }
        percent = value/(abs(settings.minValue) + abs(settings.maxValue))
        setNeedsDisplay()
    }
}
