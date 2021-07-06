//
//  PatternView.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/30/21.
//

import UIKit
import CoreGraphics

class PatternView: UIView {
    let drawPattern: CGPatternDrawPatternCallback = { _, context in
        context.addArc(center: CGPoint(x: 0, y: 0), radius: 2.0, startAngle: 0, endAngle: 2.0 * .pi, clockwise: false)
        context.setFillColor(UIColor.systemFill.cgColor)
        context.fillPath()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        UIColor.systemRed.setFill()
        context.fill(rect)
        var callbacks = CGPatternCallbacks(
            version: 0,
            drawPattern: drawPattern,
            releaseInfo: nil)
        
        guard let pattern = CGPattern(info: nil, bounds: CGRect(x: 0, y: 0, width: 10, height: 10), matrix: .identity, xStep: 5, yStep: 5, tiling: .constantSpacing, isColored: true, callbacks: &callbacks) else {
            return
        }
        
        guard let patternSpace = CGColorSpace(patternBaseSpace: nil)
        else { return }
        context.setFillColorSpace(patternSpace)
        var alpha: CGFloat = 1.0
        context.setFillPattern(pattern, colorComponents: &alpha)
        context.fill(rect)
    }
}
