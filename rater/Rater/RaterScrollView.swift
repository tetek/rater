//
//  Rater.swift
//  rater
//
//  Created by Wojciech Mandrysz on 06/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class RaterScrollView: UIScrollView {

    let ruler : RulerView
    let settings: RaterSettings
    // Init
    init (frame: CGRect, settings: RaterSettings) {
        self.settings = settings
        ruler = RulerView(frame: CGRectMake(0, 0, frame.size.width, settings.calculateHeight()), settings: settings)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.settings = RaterSettings()
        ruler = RulerView(frame: CGRectZero, settings: settings)
        super.init(coder: aDecoder)
    }

    
    override func willMoveToSuperview(newSuperview: UIView?) {
        if newSuperview != nil{
            setupGUI()
        }
    }
    
    func setupGUI() {
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.bounces = false
        
        self.contentInset = UIEdgeInsetsMake(self.frame.size.height/2 - settings.thickLine/2.0, 0, self.frame.size.height/2 - settings.thickLine/2.0, 0)

        ruler.frame = CGRectMake(0, 0, self.frame.size.width, settings.calculateHeight())
        self.contentSize = ruler.frame.size
        self.addSubview(ruler)
    }
    
    func closestPointAndValue(targetPoint: CGPoint) -> (CGPoint,CGFloat){
        let y = Int(targetPoint.y + self.contentInset.top)

        var rest = (Int(y) % Int(settings.separator))
        
        if CGFloat(rest) < (settings.separator / CGFloat(2)){
          rest = -rest
        }
        else {
            rest = Int(settings.separator) - rest
        }
        
        let prob = Int(y) + rest
        print(prob)
        
        let elem = CGFloat(Int(y) + rest) / settings.separator
        
        return (CGPointMake(targetPoint.x, CGFloat(prob)-self.contentInset.top) , CGFloat(CGFloat(settings.numberOfSteps()-1) - elem) * settings.step)
    }
}


