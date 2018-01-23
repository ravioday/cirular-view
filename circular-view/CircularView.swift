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
    
        context?.setLineWidth(30.0)
        context?.strokePath()
    }
    
    private func createCircularPathIn(_ rect: CGRect, context: CGContext) -> CGMutablePath {
        let path = CGMutablePath()
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        let angles = createArcsOnCircle()
        
        let radius = CGFloat(100.0)
        
        for (index, arc) in angles.enumerated() {
            if index > 0 {
                let x = radius * cos(arc.startAngle) + center.x
                let y = radius * sin(arc.startAngle) + center.y
                path.move(to: CGPoint(x: x, y: y))
            }
            
            path.addArc(center: center, radius: radius, startAngle: arc.startAngle, endAngle: arc.endAngle, clockwise: false)
        }
        return path
    }
    
    private func createArcsOnCircle() -> [Arc] {
        let totalParts:CGFloat = 28
        let angularSpacingBetweenArcs  = CGFloat(0.1)
        let totalCircleLengthInRadians = CGFloat(2 * Double.pi)
        
        let lengthOfEachSubArc = CGFloat((totalCircleLengthInRadians - angularSpacingBetweenArcs * totalParts) / totalParts)
        var nextAngle: CGFloat = 0.0
        var arcs:[Arc] = []
        
        for _ in stride(from: 0, to: totalParts, by: 1) {
            let start = nextAngle
            let end = start + lengthOfEachSubArc
            let arc = Arc(startAngle: start, endAngle: end)
            arcs.append(arc)
            nextAngle = end + angularSpacingBetweenArcs
        }
        
        return arcs
    }
}
