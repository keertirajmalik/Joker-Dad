//
//  CardView.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 18/04/22.
//

import UIKit

@IBDesignable class CardView: UIView {
    var cornerRadius: CGFloat = 10
    
    var shadowOpacity: CGFloat = 0.8
    var shadowColor: UIColor = .black
    var shadowRadius: CGFloat = 20
    var shadowOffset: CGSize = CGSize(width: 0, height: 25)
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = Float(shadowOpacity)
    }
}
