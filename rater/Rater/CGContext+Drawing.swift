//
//  CGContext-Drawing.swift
//  rater
//
//  Created by Wojciech Mandrysz on 14/10/15.
//  Copyright © 2015 Binarka. All rights reserved.
//
import UIKit

extension CGContext {
    
    func drawSmileFace(_ anchor: CGPoint, percent: CGFloat, settings: RaterSettings) {

        let y = anchor.y
        self.setStrokeColor(red: settings.baseColor.0 - percent, green: percent, blue: settings.baseColor.2, alpha: 1.0)
        self.setLineWidth(8)
        let radius : CGFloat = 45.0
        self.addArc(center: CGPoint(x:anchor.x, y:y), radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)

        let curveStrength : CGFloat = 30.0
        let point = curveStrength * percent
        let mouthY = y + 15
        let halfMouth :CGFloat = 24
        self.move(to: CGPoint(x: anchor.x - halfMouth, y: mouthY))
        self.addCurve(to: CGPoint(x:anchor.x + halfMouth, y: mouthY), control1: CGPoint(x:anchor.x, y:mouthY - curveStrength/2.0 + point), control2: CGPoint(x:anchor.x + halfMouth, y:mouthY))
        self.strokePath()
    }
    
    func drawCentralLine(_ anchor: CGPoint, percent: CGFloat, settings: RaterSettings){
        let y = anchor.y
        self.setStrokeColor(red: settings.baseColor.0 - percent, green: percent, blue: settings.baseColor.2, alpha: 1.0)
        self.setLineWidth(settings.thickLine)
        self.move(to: CGPoint(x: anchor.x, y: y))
        self.addLine(to: CGPoint(x: settings.thickLineWidth*1.5, y: y))
        self.strokePath()
    }
    
    func drawRuler(_ settings: RaterSettings) {
        for i in 0 ..< settings.numberOfSteps() + 1{
            
            self.setStrokeColor(red: 181/255.0, green: 181/255.0, blue: 181/255.0, alpha: 1.0)
            var x : CGFloat
            if i %  settings.bigStep == 0{
                self.setLineWidth(settings.thickLine)
                x = settings.thickLineWidth
            }
            else{
                self.setLineWidth(settings.skinLine)
                x =  settings.skinLineWidth
            }
            
            self.move(to: CGPoint(x: 0, y: settings.thickLine/2.0 + CGFloat(i) * settings.separator))
            self.addLine(to: CGPoint(x: x, y: settings.thickLine/2.0 +  CGFloat(i) * settings.separator))
            self.strokePath()
        }
    }
}
