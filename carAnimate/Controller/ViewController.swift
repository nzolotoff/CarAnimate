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
        static let carViewHeight: Double = 180
        static let carViewWidth: Double = 360
        static let carTopIdent: Double = 100
    }
    
    // MARK: - Variables
    private var carView = CarView()
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCarView()
    }
    
    // MARK: - Private methods
    private func configureCarView() {
        carView.backgroundColor = .white
        
        view.addSubview(carView)
        carView.setWidth(Constants.carViewWidth)
        carView.setHeight(Constants.carViewHeight)
        carView.pinTop(to: view, Constants.carTopIdent)
        carView.pinCenterX(to: view)
    }
}

