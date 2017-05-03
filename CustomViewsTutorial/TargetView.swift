//
//  TargetView.swift
//  CustomViewsTutorial
//
//  Created by James Rochabrun on 5/3/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

let CROSSHAIRS_CIRCLE_SIZE: CGFloat = 20.0
let CROSSHAIRS_SIZE: CGFloat = 30.0
let CROSSHAIRS_CIRCLE_INSET: CGFloat = (CROSSHAIRS_SIZE - CROSSHAIRS_CIRCLE_SIZE) / 2

class TargetView: UIView {
    
    private var crossHairsLayer: CAShapeLayer
    
    override init(frame: CGRect) {
        crossHairsLayer = CAShapeLayer()
        super.init(frame: frame)
        
        backgroundColor = .clear
        isUserInteractionEnabled = true
        crossHairsLayer.bounds = CGRect(x: 0, y: 0, width: CROSSHAIRS_SIZE, height: CROSSHAIRS_SIZE)
        crossHairsLayer.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        layer.addSublayer(crossHairsLayer)
        crossHairsLayer.strokeColor = UIColor.black.cgColor
        crossHairsLayer.fillColor = UIColor.clear.cgColor
        print(String(describing: crossHairsLayer.bounds))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let crossHairPos = touch.location(in: self)
            self.crossHairsLayer.position = crossHairPos
            
            //calling drawrect again
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        //circlap part
        let circlePathBox = crossHairsLayer.bounds.insetBy(dx: CROSSHAIRS_CIRCLE_INSET, dy: CROSSHAIRS_CIRCLE_INSET)
        let circlePath = UIBezierPath(ovalIn: circlePathBox)
        crossHairsLayer.path = circlePath.cgPath
        
        //cross part
        var drawPoint: CGPoint
        // draw vertical first
        drawPoint = CGPoint(x: crossHairsLayer.bounds.size.width / 2, y: 0.0)
        circlePath.move(to: drawPoint)
        drawPoint.y = crossHairsLayer.bounds.height
        circlePath.addLine(to: drawPoint)
        
        //draw horizontal
        drawPoint = CGPoint(x: 0, y: crossHairsLayer.bounds.size.height / 2)
        circlePath.move(to: drawPoint)
        drawPoint.x = crossHairsLayer.bounds.width
        circlePath.addLine(to: drawPoint)
        
        crossHairsLayer.path = circlePath.cgPath
    }
}
