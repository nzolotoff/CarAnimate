//
//  CarView.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 22.10.2024.
//

import UIKit

final class CarView: UIView {
    // MARK: - Constants
    enum Constants {
        enum barAnimation {
            static let duration: Double = 0.5
            static let delay: Double = 0.1
            static let keyFrames: [Double] = [3.5, -2, 1.5, -1]
        }
        
        enum wheelAnimation {
            static let duration: Double = 1
            static let delay: Double = 0
            static let options: UIView.AnimationOptions = [.repeat, .curveLinear]
        }
    }
    
    // MARK: - Variables
    private var carBody = [CarElement]()
    private var carWheels = [CarWheel]()
    
    // MARK: - Properties
    let direction: Direction
    
    // MARK: - Lyfecycle
    init(direction: Direction) {
        self.direction = direction
        super.init(frame: .zero)
        setupCarBody()
        setupCarWheels()
        wheelsAnimate()
        carAnimate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func checkDirection() {
        switch direction {
        case .leftToRight: break
        case .rightToLeft:
            CarBodyModel.barHeights.reverse()
            CarBodyModel.barsTopIdent.reverse()
        }
    }
    
    private func setupCarBody() {
        checkDirection()
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
        let rightWheel = createCarWheel()
        carWheels.append(rightWheel)
        switch direction {
        case .leftToRight:
            leftWheel.pinLeft(to: self, WheelModel.wheelXIdent(direction: self.direction))
            rightWheel.pinLeft(to: leftWheel, WheelModel.wheelsSpacing)
        case .rightToLeft:
            rightWheel.pinRight(to: self, WheelModel.wheelXIdent(direction: self.direction))
            leftWheel.pinRight(to: rightWheel, WheelModel.wheelsSpacing)
        }
        leftWheel.pinBottom(to: self, WheelModel.wheelBottomIdent)
        rightWheel.pinBottom(to: leftWheel)
    }
    
    private func wheelsAnimate() {
        for wheel in carWheels.indices {
            UIView.animate(
                withDuration: Constants.wheelAnimation.duration,
                delay: Constants.wheelAnimation.delay,
                options: Constants.wheelAnimation.options
            ) {
                switch self.direction {
                case .leftToRight: self.carWheels[wheel].transform = CGAffineTransform(rotationAngle: .pi)
                case .rightToLeft: self.carWheels[wheel].transform = CGAffineTransform(rotationAngle: -0.99 * .pi)
                }
            }
        }
    }
    
    private func carAnimate() {
        for element in carBody.indices {
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                // start animation on this element
                if element == self.carBody.count - 3 {
                    self.carAnimate()
                }
            }
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation.duration = Constants.barAnimation.duration
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.beginTime = CACurrentMediaTime() + Double(element) * Constants.barAnimation.delay
            animation.values = Constants.barAnimation.keyFrames
            // animate every element
            carBody[carBody.count - element - 1].layer.add(animation, forKey: nil)
            CATransaction.commit()
        }
    }
}
