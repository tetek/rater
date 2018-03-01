//
//  Rater.swift
//  rater
//
//  Created by Wojciech Mandrysz on 06/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class RaterScrollView: UIScrollView {

    var ruler       : RulerView!
    var settings    : RaterSettings = RaterSettings()

    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil{
            setupGUI()
        }
    }
    
    func setupGUI() {
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.bounces = false
        self.contentInset = UIEdgeInsetsMake(self.frame.size.height/2 - settings.thickLine/2.0, 0, self.frame.size.height/2 - settings.thickLine/2.0, 0)
        
        ruler = RulerView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: settings.calculateHeight()))
        ruler.settings = settings
        self.contentSize = ruler.frame.size
        self.addSubview(ruler)
        self.contentOffset = closestPointAndValue(CGPoint(x: 0, y: ruler.frame.size.height/2.0 - self.frame.size.height/2.0 - settings.thickLine/2.0)).0

    }
    
    func closestPointAndValue(_ targetPoint: CGPoint) -> (CGPoint,CGFloat){
        let y = Int(targetPoint.y + self.contentInset.top)

        var rest = (Int(y) % Int(settings.separator))
        
        if CGFloat(rest) < (settings.separator / CGFloat(2)){
          rest = -rest
        }
        else {
            rest = Int(settings.separator) - rest
        }
        
        let prob = Int(y) + rest
        
        let elem = CGFloat(Int(y) + rest) / settings.separator
        
        return (CGPoint(x: targetPoint.x, y: CGFloat(prob)-self.contentInset.top) , CGFloat(CGFloat(settings.numberOfSteps()-1) - elem) * settings.step)
    }
    
    func currentValue() -> CGFloat {
        return self.closestPointAndValue(self.contentOffset).1
    }
}


