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

    let raterScrollView : RaterScrollView
    let selectorView : SelectorView
    var audioPlayer : AVAudioPlayer!
    var lastValue : CGFloat = 0
    
    init(settings: RaterSettings) {
        raterScrollView = RaterScrollView(frame: CGRectZero, settings: settings)
        selectorView = SelectorView(settings: settings)
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        raterScrollView = RaterScrollView(frame: CGRectZero,settings: RaterSettings())
        selectorView = SelectorView(settings: RaterSettings())
        super.init(coder: aDecoder)
        
        let filePathUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("tick", ofType: "wav")!)


        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: filePathUrl)
            audioPlayer.volume = 0.01
        } catch _ {
            audioPlayer = nil
        }
    }
   
    override func willMoveToSuperview(newSuperview: UIView?) {
        if newSuperview != nil{
            raterScrollView.frame = self.bounds
            raterScrollView.delegate = self
            self.addSubview(raterScrollView)
            let selectorHeight : CGFloat = 100.0
            selectorView.frame = CGRectMake(0, self.frame.size.height/2 - selectorHeight/2.0, self.frame.size.width, selectorHeight)
            self.addSubview(selectorView)
            
        }
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
        print(targetContentOffset.memory)
        let p = raterScrollView.closestPointAndValue(targetContentOffset.memory)
        targetContentOffset.memory.y = p.0.y
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.contentInset.top
        if fabs(y - lastValue) > raterScrollView.settings.separator{
            audioPlayer.play()
            lastValue = y
        }
        
        let p = raterScrollView.closestPointAndValue(scrollView.contentOffset)
        selectorView.updateValue(p.1)
        print(scrollView.contentOffset.y)
    }
}
