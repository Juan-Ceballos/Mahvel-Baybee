//
//  PatternView.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/30/21.
//

import UIKit
import CoreGraphics

class PatternView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        UIColor.systemIndigo.setFill()
        context.fill(rect)
    }
}
