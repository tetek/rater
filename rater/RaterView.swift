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

    let raterScrollView : RaterScrollView = RaterScrollView()
    let selectorView = SelectorView()
    var audioPlayer : AVAudioPlayer!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        player = AVAudioPlayer(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("tick", ofType: "wav")!)!)
        let filePathUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("tick", ofType: "wav")!)

//        if let audioPlayer =
//            // use audioPlayer
//        } else {
//            print(initError) // handle error
//        }
////        let contents: NSString?

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
    var lastValue : CGFloat = 0
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.contentInset.top
        if fabs(y - lastValue) > raterScrollView.ruler.separator{
            audioPlayer.play()
            lastValue = y//scrollView.contentOffset.y
        }
        
        let p = raterScrollView.closestPointAndValue(scrollView.contentOffset)
        selectorView.updateValue(p.1)
        print(scrollView.contentOffset.y)
    }
}
