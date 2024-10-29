//
//  carElement.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 15.10.2024.
//

import Foundation
import UIKit

final class CarElement: UIView {
    // MARK: - Constants
    enum Constants {
        static let elementRadius: Double = 5
    }
    
    // MARK: - Model
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
    let model: Model
    
    // MARK: - Lyfecycle
    init(model: Model) {
        self.model = model
        super.init(frame: .zero)
        configureCarElement()
        animateElement()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureCarElement() {
        backgroundColor = .systemBlue
        layer.cornerRadius = Constants.elementRadius
    }
    
    private func animateElement() {
        UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: [.repeat, .calculationModeLinear], animations: {
            // Первое поднятие
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: 0, y: -10) // Поднимаем на 10 пикселей
            }
            // Опускаем обратно
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: 0, y: 0) // Возвращаем на место
            }
            // Второе поднятие
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: 0, y: -5) // Поднимаем на 5 пикселей
            }
            // Опускаем обратно
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: 0, y: 0) // Возвращаем на место
            }
        })
    }
}
