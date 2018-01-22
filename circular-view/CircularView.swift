//
//  CircularView.swift
//  circular-view
//
//  Created by Ravi Joshi on 1/21/18.
//  Copyright © 2018 Ravi Joshi. All rights reserved.
//

import UIKit

struct Arc {
    var startAngle: CGFloat
    var endAngle: CGFloat
}

class CircularView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let path = createCircularPathIn(rect, context: context!)

        context?.addPath(path)
        
        
        context?.setLineWidth(1.0)
        context?.strokePath()
    }
    
    private func createCircularPathIn(_ rect: CGRect, context: CGContext) -> CGMutablePath {
        let path = CGMutablePath()
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        let angles = createPoints()
        
        let angle = angles[0]
        path.addArc(center: center, radius: 50, startAngle: angle.startAngle, endAngle: angle.endAngle, clockwise: false)
    
        let angle1 = angles[1]
        
        
        let angleOffset = 0.3
        
        let x = 50 * cos(angle1.startAngle) + center.x
        let y = 50 * sin(angle1.startAngle) + center.y
        
        // This is now center, but we need a point that corresponds to the start angle
        path.move(to: CGPoint(x: x, y: y))
        
//        path.move(to: center)
        
        path.addArc(center: center, radius: 50, startAngle: angle1.startAngle, endAngle: angle1.endAngle, clockwise: false)
        return path
    }
    
    private func createPoints() -> [Arc] {
        let totalParts:CGFloat = 10
        let totalCircleLengthInRadians = CGFloat(2 * Double.pi)
        
        let lengthOfEachSubArc = CGFloat(totalCircleLengthInRadians / totalParts)
        
        let nextAngle: CGFloat = 0.0
        let endAngle = lengthOfEachSubArc
        
        let arc = Arc(startAngle:nextAngle, endAngle: endAngle)
        let arc1 = Arc(startAngle: endAngle + 0.3, endAngle:endAngle + 0.3 + endAngle)
        
        return [arc, arc1]
    }
}
