//
//  JKTabBar.swift
//  JKTabBarExample
//
//  Created by Jeet Kapadia on 24/12/22.
//

import UIKit

final public class JKTabBar: UITabBar {
    
    @IBInspectable var tabColor: UIColor?
    @IBInspectable var tabRadius: CGFloat = 0
    
    private var shapeLayer: CALayer?
    
    public override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        self.isTranslucent = false
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = tabColor?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -2);
        shapeLayer.shadowOpacity = 0.21
        shapeLayer.shadowRadius = 8
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: tabRadius).cgPath
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: tabRadius, height: 0.0))
        
        return path.cgPath
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame = self.frame
        tabFrame.size.height = 55
        tabFrame.origin.y = self.frame.origin.y + self.frame.height - 55
        self.layer.cornerRadius = 9
        self.frame = tabFrame
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
    }
}

