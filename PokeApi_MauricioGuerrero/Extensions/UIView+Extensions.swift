//
//  UIView+Extensions.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 29/10/22.
//

import UIKit

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func loadGradient(colors: [UIColor] = [.white,.gray], ubicaciones: [NSNumber]? = nil,puntoInicial: CGPoint = CGPoint(x: 0, y: 1), puntoFinal : CGPoint = CGPoint(x: 1, y: 0)) {
       let gradient: CAGradientLayer = CAGradientLayer()
       gradient.frame = self.bounds
       gradient.name = "gradientLayer"
       gradient.colors = colors.map { $0.cgColor }
       gradient.locations = ubicaciones
       gradient.startPoint = puntoInicial
       gradient.endPoint = puntoFinal
       self.layer.insertSublayer(gradient, at: 0)
    }
}
