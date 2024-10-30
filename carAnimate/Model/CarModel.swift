//
//  CarModel.swift
//  carAnimate
//
//  Created by Nikita Zolotov on 22.10.2024.
//

import Foundation

struct CarBodyModel {
    static var barHeights: [Double] = [45, 65, 90, 75, 75, 75, 97, 97, 97, 97, 97, 75, 65, 35, 27, 27, 40]
    static var barsTopIdent: [Double] = [84, 73, 54, 42, 40, 41, 46, 47, 48, 51, 57, 64, 72, 80, 84, 90, 92]
    static let barsSpacing: Double = 10
}

struct WheelModel {
    static let wheelWidth: Double = 45
    static let wheelBottomIdent: Double = 13
    static let wheelsSpacing: Double = 201
    
    static func wheelXIdent(direction: Direction) -> Double {
        return (direction == .leftToRight) ? 64 : 90
    }
}

enum Direction {
    case leftToRight
    case rightToLeft
}
