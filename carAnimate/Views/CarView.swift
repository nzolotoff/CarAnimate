//
//  CarView.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 22.10.2024.
//

import UIKit

final class CarView: UIView {
    
    // MARK: - Variables
    private var carModel = CarModel()
    private var carBody = [CarElement]()
    private var carWheels = [CarWheel]()
    
    // MARK: - Lyfecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCarBody()
        setupCarWheels()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupCarBody() {
        for i in 0..<carModel.heights.count {
            let element = CarElement(model: CarElement.Model(height: carModel.heights[i], topSpacing: carModel.topSpacing[i]))
            carBody.append(element)
            self.addSubview(element)
            element.setWidth(element.model.width)
            element.setHeight(element.model.height)
            element.pinLeft(to: self, Double(i) * (carModel.elementsSpacing + element.model.width))
            element.pinTop(to: self, element.model.topSpacing)
        }
    }
    
    private func createCarWheel() -> CarWheel {
        let wheel = CarWheel(width: 45)
        self.addSubview(wheel)
        wheel.setWidth(wheel.width)
        wheel.setHeight(wheel.width)
        return wheel
    }
    
    private func setupCarWheels() {
        let leftWheel = createCarWheel()
        carWheels.append(leftWheel)
        leftWheel.pinLeft(to: carBody[0], 64)
        leftWheel.pinBottom(to: self, 13)
        
        let rightWheel = createCarWheel()
        carWheels.append(rightWheel)
        rightWheel.pinLeft(to: leftWheel, 203)
        rightWheel.pinBottom(to: leftWheel)
    }
}
