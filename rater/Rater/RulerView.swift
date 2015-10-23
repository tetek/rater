//
//  RulerView.swift
//  rater
//
//  Created by Wojciech Mandrysz on 02/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class RulerView: UIView {

    var settings : RaterSettings = RaterSettings()

    override func didMoveToSuperview() {
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        let cntx = UIGraphicsGetCurrentContext()
        cntx?.drawRuler(settings)
        super.drawRect(rect)
    }
    
}
