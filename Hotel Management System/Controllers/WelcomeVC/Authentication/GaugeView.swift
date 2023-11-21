//
//  GaugeView.swift
//  Hotel Management System
//
//  Created by mayur bobade on 20/11/23.
//

import Foundation
import UIKit

class AnimatedGaugeView: UIView {
    private let gaugeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGaugeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGaugeLayer()
    }
    
    private func setupGaugeLayer() {
        // Define the path for the gauge
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = min(bounds.width, bounds.height) / 2 - 10
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + CGFloat.pi * 2
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // Configure the gauge layer
        gaugeLayer.path = path.cgPath
        gaugeLayer.strokeColor = UIColor.blue.cgColor
        gaugeLayer.fillColor = UIColor.clear.cgColor
        gaugeLayer.lineWidth = 10.0
        gaugeLayer.strokeEnd = 0.0 // Initial value
        
        // Add the gauge layer to the view's layer
        layer.addSublayer(gaugeLayer)
    }
    
    func animateGauge(to value: CGFloat) {
        let animation = CAKeyframeAnimation(keyPath: "strokeEnd")
        animation.values = [gaugeLayer.strokeEnd, value]
        animation.keyTimes = [0.0, 1.0]
        animation.timingFunctions = [CAMediaTimingFunction(name: .easeInEaseOut)]
        animation.duration = 1.0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        gaugeLayer.add(animation, forKey: "gaugeAnimation")
    }
}
