//
//  ViewController.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 15.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Variables
    private let carModel = CarModel()
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
        carView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carView)
        NSLayoutConstraint.activate([
            carView.heightAnchor.constraint(equalToConstant: 180),
            carView.widthAnchor.constraint(equalToConstant: 360),
            carView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: carModel.topSpacing.min() ?? 0),
            carView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21)
        ])
    }
}

