//
//  ViewController.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 15.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        enum CarView {
            static let height: Double = 180
            static let width: Double = 360
            static let topIdent: Double = 100
        }
        
        enum MovementAnimation {
            static let distance: Double = 700
            static let duration: Double = 1.5
            static let delay: Double = 0
            static let options: UIView.AnimationOptions = [.repeat, .curveLinear]
        }
    }
    
    // MARK: - Variables
    private var carView = CarView(direction: .rightToLeft)
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCarView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateCarMovement()
    }
    
    // MARK: - Private methods
    private func configureCarView() {
        carView.backgroundColor = .white
        view.addSubview(carView)
        carView.setWidth(Constants.CarView.width)
        carView.setHeight(Constants.CarView.height)
        carView.pinTop(to: view, Constants.CarView.topIdent)
        carView.pinCenterX(to: view)
    }
    
    private func animateCarMovement() {
        let constant: Double = carView.direction == .leftToRight ? Constants.MovementAnimation.distance : -1 * Constants.MovementAnimation.distance
        UIView.animate(
            withDuration: Constants.MovementAnimation.duration,
            delay: Constants.MovementAnimation.delay,
            options: Constants.MovementAnimation.options
        ) {
            self.carView.transform = CGAffineTransform(translationX: constant, y: 0)
        } completion: { _ in
            UIView.animate(withDuration: Constants.MovementAnimation.duration) {
                self.carView.transform = .identity
            }
        }
    }
}
