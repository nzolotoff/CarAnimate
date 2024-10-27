//
//  carElement.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 15.10.2024.
//

import Foundation
import UIKit

final class CarElement: UIView {
    struct Model {
        var width: Double
        var height: Double
        var topSpacing: Double
        
        init(width: Double = 10, height: Double, topSpacing: Double) {
            self.width = width
            self.height = height
            self.topSpacing = topSpacing
        }
    }
   // MARK: - Properties
    var width: Double = 10
    var height: Double
    var topSpacing: Double
    
    // MARK: - Lyfecycle
    init(model: Model) {
        width = model.width
        height = model.height
        topSpacing = model.topSpacing
        super.init(frame: .zero)
    }
    
    @available(*, deprecated, message: "Use Model instead")
    init(height: Double, topSpacing: Double) {
        self.height = height
        self.topSpacing = topSpacing
        super.init(frame: .zero)
        configureCarElement()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private methods
    private func configureCarElement() {
        backgroundColor = .systemBlue
        layer.cornerRadius = 5
    }
    
    private func animateElement() {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0.9, options: [.calculationModeLinear], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.transform = CGAffineTransform(translationX: 0, y: 2)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                self.transform = CGAffineTransform(translationX: 0, y: -2)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.transform = .identity
            }
        })
    }
}
