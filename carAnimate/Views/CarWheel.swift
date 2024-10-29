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
        enum Disk {
            static let diskWitdth: Double = 26
            static let diskHeight: Double = 26
            static let diskRadius: Double = 11
            static let diskAngle: Double = 40
        }
    }
    
    // MARK: - Properties
    let width: Double
    let disk = UIView()
    
    // MARK: - Lyfecycle
    init(width: Double) {
        self.width = width
        super.init(frame: .zero)
        configureWheel()
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
        disk.layer.cornerRadius = Constants.Disk.diskRadius
        disk.transform = CGAffineTransform(rotationAngle: Constants.Disk.diskAngle)
        self.addSubview(disk)
        disk.setWidth(Constants.Disk.diskWitdth)
        disk.setHeight(Constants.Disk.diskHeight)
        disk.pinCenter(to: self)
    }
}
