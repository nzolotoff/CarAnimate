//
//  UIView+Shadow.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 30.10.2024.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(color: UIColor = .black, opacity: Float = 0.7, offset: CGSize = .zero, radius: CGFloat = 3) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
}

