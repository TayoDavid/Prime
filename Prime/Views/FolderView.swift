//
//  Folder.swift
//  Prime
//
//  Created by Omotayo on 13/05/2022.
//

import UIKit

class FolderView: UIView {
    
    var color: CGColor?
    
    override func draw(_ rect: CGRect) {
        let width: CGFloat = self.width - 10
        let height: CGFloat = self.height - 10
        let slantWidth: CGFloat = width / 2.1
        let padding: CGFloat = 10
        let radius: CGFloat = 20
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: padding, y: padding))
        path.addLine(to: CGPoint(x: slantWidth, y: padding))
        path.addLine(to: CGPoint(x: slantWidth + 10, y: height * 0.15))
        path.addLine(to: CGPoint(x: width - radius, y: height * 0.15))
        path.addArc(
            withCenter: CGPoint(x: width - radius, y: height * 0.15 + radius),
            radius: radius,
            startAngle: 180 * .pi / 180,
            endAngle: 0 * .pi / 180,
            clockwise: true
        )
        path.addLine(to: CGPoint(x: width, y: height - radius - padding))
        path.addArc(
            withCenter: CGPoint(x: width - radius, y: height - radius - padding),
            radius: radius,
            startAngle: 0 * .pi / 180,
            endAngle:  90 * .pi / 180,
            clockwise: true
        )
        path.addLine(to: CGPoint(x: padding + radius, y: height - padding))
        path.addArc(
            withCenter: CGPoint(x: padding + radius, y: height - radius - padding),
            radius: radius,
            startAngle: 90 * .pi / 180,
            endAngle:  180 * .pi / 180,
            clockwise: true
        )
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = self.color ?? Constants.folderColor.cgColor
        self.layer.addSublayer(shapeLayer)
    }
    
}
