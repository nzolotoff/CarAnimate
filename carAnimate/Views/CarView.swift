//
//  CarView.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 22.10.2024.
//

import UIKit

final class CarView: UIView {
    
    // MARK: - Variables
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
        for i in 0..<CarBodyModel.barHeights.count {
            let element = CarElement(model: CarElement.Model(height: CarBodyModel.barHeights[i], topSpacing: CarBodyModel.barsTopIdent[i]))
            carBody.append(element)
            self.addSubview(element)
            element.setWidth(element.model.width)
            element.setHeight(element.model.height)
            element.pinLeft(to: self, Double(i) * (CarBodyModel.barsSpacing + element.model.width))
            element.pinTop(to: self, element.model.topSpacing)
        }
    }
    
    private func createCarWheel() -> CarWheel {
        let wheel = CarWheel(width: WheelModel.wheelWidth)
        self.addSubview(wheel)
        wheel.setWidth(wheel.width)
        wheel.setHeight(wheel.width)
        return wheel
    }
    
    private func setupCarWheels() {
        let leftWheel = createCarWheel()
        carWheels.append(leftWheel)
        leftWheel.pinLeft(to: self, WheelModel.wheelLeftIdent)
        leftWheel.pinBottom(to: self, WheelModel.wheelBottomIdent)
        
        let rightWheel = createCarWheel()
        carWheels.append(rightWheel)
        rightWheel.pinLeft(to: leftWheel, WheelModel.wheelsSpacing)
        rightWheel.pinBottom(to: leftWheel)
    }
}
