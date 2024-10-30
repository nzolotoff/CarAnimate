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
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureCarElement() {
        backgroundColor = .systemBlue
        layer.cornerRadius = Constants.elementRadius
        addShadow()
    }
}
