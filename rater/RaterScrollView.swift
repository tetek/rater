//
//  Rater.swift
//  rater
//
//  Created by Wojciech Mandrysz on 06/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class RaterScrollView: UIScrollView {

    let ruler = RulerView()
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.showsHorizontalScrollIndicator = false
//        self.showsVerticalScrollIndicator = false
//        self.contentInset = UIEdgeInsetsMake(self.frame.size.height/2, 0, self.frame.size.height/2, 0)
//
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.showsHorizontalScrollIndicator = false
//        self.showsVerticalScrollIndicator = false
//    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        if newSuperview != nil{
            self.showsHorizontalScrollIndicator = false
            self.showsVerticalScrollIndicator = false

            self.contentInset = UIEdgeInsetsMake(self.frame.size.height/2 - ruler.thickLine/2.0, 0, self.frame.size.height/2 - ruler.thickLine/2.0, 0)
            self.backgroundColor = UIColor.clearColor()

            ruler.frame = CGRectMake(0, 0, self.frame.size.width, ruler.calculateHeight())
            print(ruler.frame)
            ruler.backgroundColor = UIColor.redColor()
            
            self.contentSize = ruler.frame.size
            self.addSubview(ruler)
//            self.decelerationRate = UIScrollViewDecelerationRateFast;
            self.bounces = false


        }
    }
    
    func closestPointAndValue(targetPoint: CGPoint) -> (CGPoint,CGFloat){
        let y = Int(targetPoint.y + self.contentInset.top)
        print(y)
        var rest = (Int(y) % Int(ruler.separator))
        if CGFloat(rest) < (ruler.separator / CGFloat(2)){
          rest = -rest
        }
        else {
            rest = Int(ruler.separator) - rest
        }
        let prob = Int(y) + rest
        print(prob)
        
        let elem = CGFloat(Int(y) + rest) / ruler.separator
//        print(elem * ruler.step)s
        
        return (CGPointMake(targetPoint.x, CGFloat(prob)-self.contentInset.top) , elem * ruler.step)
    }
}


