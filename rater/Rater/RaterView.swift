//
//  RaterView.swift
//  rater
//
//  Created by Wojciech Mandrysz on 06/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit
import AVFoundation

class RaterView: UIView, UIScrollViewDelegate {

    var raterScrollView     : RaterScrollView!
    var selectorView        : SelectorView!
    var settings            : RaterSettings = RaterSettings()
    var completition        : ((CGFloat) -> ())?
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        if newSuperview != nil{
            raterScrollView = RaterScrollView(frame: self.bounds)
            selectorView = SelectorView()

            raterScrollView.settings = settings
            selectorView.settings = settings
            raterScrollView.delegate = self
            self.addSubview(raterScrollView)
            let selectorHeight : CGFloat = 100.0
            selectorView.frame = CGRectMake(0, self.frame.size.height/2 - selectorHeight/2.0, self.frame.size.width, selectorHeight)
            self.addSubview(selectorView)
            
            let tap = UITapGestureRecognizer(target: self, action: "tapped")
            self.addGestureRecognizer(tap)
        }
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
        let p = raterScrollView.closestPointAndValue(targetContentOffset.memory)
        targetContentOffset.memory.y = p.0.y
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let p = raterScrollView.closestPointAndValue(scrollView.contentOffset)
        selectorView.updateValue(p.1)
    }
    
    func tapped() {
        completition?(raterScrollView.currentValue())
    }
}
