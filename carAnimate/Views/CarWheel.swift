//
//  CarWheel.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 16.10.2024.
//

import UIKit

final class CarWheel: UIView {
    // MARK: - Constants
    enum Constants {
        static let diskWidthHeight: Double = 28
    }
    
    // MARK: - Properties
    let width: Double
    let disk = UIView()
    
    // MARK: - Lyfecycle
    init(width: Double) {
        self.width = width
        super.init(frame: .zero)
        configureWheel()
        animateWheel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureWheel() {
        backgroundColor = .systemBlue
        layer.cornerRadius = self.width / 2
        configureDisk()
    }
    
    private func configureDisk() {
        disk.backgroundColor = .white
        disk.layer.cornerRadius = 11
        disk.transform = CGAffineTransform(rotationAngle: 40)
        disk.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(disk)
        NSLayoutConstraint.activate([
            disk.heightAnchor.constraint(equalToConstant: Constants.diskWidthHeight),
            disk.widthAnchor.constraint(equalToConstant: Constants.diskWidthHeight),
            disk.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            disk.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func animateWheel() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .curveLinear]) {
            self.transform = self.transform.rotated(by: .pi)
        }
    }
}
