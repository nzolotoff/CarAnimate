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
            let element = CarElement(height: carModel.heights[i], topSpacing: carModel.topSpacing[i])
            carBody.append(element)
            self.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                element.widthAnchor.constraint(equalToConstant: element.width),
                element.heightAnchor.constraint(equalToConstant: element.height),
                element.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Double(i) * (carModel.elementsSpacing + element.width)),
                element.topAnchor.constraint(equalTo: self.topAnchor, constant: element.topSpacing)
            ])
        }
    }
    
    private func createCarWheel() -> CarWheel {
        let wheel = CarWheel(width: 45)
        wheel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wheel)
        NSLayoutConstraint.activate([
            wheel.heightAnchor.constraint(equalToConstant: wheel.width),
            wheel.widthAnchor.constraint(equalToConstant: wheel.width)
        ])
        return wheel
    }
    
    private func setupCarWheels() {
        let leftWheel = createCarWheel()
        carWheels.append(leftWheel)
        NSLayoutConstraint.activate([
            leftWheel.leadingAnchor.constraint(equalTo: carBody[0].leadingAnchor, constant: 60),
            leftWheel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 13 * -1)
        ])
        let rightWheel = createCarWheel()
        carWheels.append(rightWheel)
        NSLayoutConstraint.activate([
            rightWheel.leadingAnchor.constraint(equalTo: leftWheel.trailingAnchor, constant: 158),
            rightWheel.bottomAnchor.constraint(equalTo: leftWheel.bottomAnchor)
        ])
    }
}
