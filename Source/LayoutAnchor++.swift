//
//  LayoutAnchor++.swift
//  AltAutoLayout
//
//  Created by ちゅーたつ on 2018/05/26.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

// left, right, centerX
protocol HorizontalConstraints {
}

// top, bottom, centerY
protocol VerticalConstraints {
}

// width, height
protocol DimensionalConstraints {
}



extension NSLayoutXAxisAnchor: HorizontalConstraints {
}
extension NSLayoutYAxisAnchor: VerticalConstraints {
}
extension NSLayoutDimension: DimensionalConstraints {
}


typealias ConstraintsTarget = HorizontalConstraints & VerticalConstraints & DimensionalConstraints

extension Int: ConstraintsTarget {}
extension CGFloat: ConstraintsTarget {}
extension UIView: ConstraintsTarget {}




//LayoutAnchor + 10
class AnchorCalculable<T> {
    
    var target: T
    var amount: CGFloat
    
    init(target: T, amount: CGFloat) {
        self.target = target
        self.amount = amount
    }
}

//この2つも多分共通化できるはず。
extension NSLayoutXAxisAnchor {

    static func +(lhd: NSLayoutXAxisAnchor, rhd: CGFloat) -> AnchorCalculable<NSLayoutXAxisAnchor> {
        return AnchorCalculable(target: lhd, amount: rhd)
    }

    static func -(lhd: NSLayoutXAxisAnchor, rhd: CGFloat) -> AnchorCalculable<NSLayoutXAxisAnchor> {
        return AnchorCalculable(target: lhd, amount: -rhd)
    }
}

extension NSLayoutYAxisAnchor {

    static func +(lhd: NSLayoutYAxisAnchor, rhd: CGFloat) -> AnchorCalculable<NSLayoutYAxisAnchor> {
        return AnchorCalculable(target: lhd, amount: rhd)
    }

    static func -(lhd: NSLayoutYAxisAnchor, rhd: CGFloat) -> AnchorCalculable<NSLayoutYAxisAnchor> {
        return AnchorCalculable(target: lhd, amount: -rhd)
    }
}

extension NSLayoutDimension {

    static func +(lhd: NSLayoutDimension, rhd: CGFloat) -> AnchorCalculable<NSLayoutDimension> {
        return AnchorCalculable(target: lhd, amount: rhd)
    }

    static func -(lhd: NSLayoutDimension, rhd: CGFloat) -> AnchorCalculable<NSLayoutDimension> {
        return AnchorCalculable(target: lhd, amount: -rhd)
    }
}


extension AnchorCalculable: HorizontalConstraints where T == NSLayoutXAxisAnchor {
}

extension AnchorCalculable: VerticalConstraints where T == NSLayoutYAxisAnchor {
}

extension AnchorCalculable: DimensionalConstraints where T == NSLayoutDimension {
}
