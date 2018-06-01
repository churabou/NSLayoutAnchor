import UIKit


fileprivate extension NSLayoutConstraint {
    
    func activate() {
        isActive = true
    }
}


enum LayoutTarget {
    
    enum XAxis {
        case left, right, centerX
    }
    
    enum YAxis {
        case top, bottom, centerY
    }
    
    enum Dimension {
        case width, height
    }
}

extension UIView {
    
    func layoutAnchor(_ target: LayoutTarget.XAxis) -> NSLayoutXAxisAnchor {
        switch target {
        case .left: return leftAnchor
        case .right: return rightAnchor
        case .centerX: return centerXAnchor
        }
    }
    
    func layoutAnchor(_ target: LayoutTarget.YAxis) -> NSLayoutYAxisAnchor {
        switch target {
        case .top: return topAnchor
        case .bottom: return bottomAnchor
        case .centerY: return centerYAnchor
        }
    }
    
    func layoutAnchor(_ target: LayoutTarget.Dimension) -> NSLayoutDimension {
        switch target {
        case .width: return widthAnchor
        case .height: return heightAnchor
        }
    }
}


class LayoutMaker {
    
    var base: UIView
    init (_ base: UIView) {
        self.base = base
        base.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func activateLayoutAnchorXAxis(_ constrain: HorizontalConstraints, target: LayoutTarget.XAxis) {
        
        let anchor = base.layoutAnchor(target)
        
        if let constrain = constrain as? AnchorCalculable<NSLayoutXAxisAnchor> {
            anchor.constraint(equalTo: constrain.target, constant: constrain.amount).activate()
        }
        else if let constrain = constrain as? NSLayoutXAxisAnchor {
            anchor.constraint(equalTo: constrain).activate()
        }
        else if let view = constrain as? UIView {
            anchor.constraint(equalTo: view.layoutAnchor(target)).activate()
        }
        else if let constrain = constrain as? CGFloat {
            anchor.constraint(equalTo: base.superview!.layoutAnchor(target), constant: constrain).activate()
        }
        else if let constrain = constrain as? Int {
            anchor.constraint(equalTo: base.superview!.layoutAnchor(target), constant: CGFloat(constrain)).activate()
        }
    }
    
    func activateLayoutAnchorYAxis(_ constrain: VerticalConstraints, target: LayoutTarget.YAxis) {
        
        let anchor = base.layoutAnchor(target)
        
        if let constrain = constrain as? AnchorCalculable<NSLayoutYAxisAnchor> {
            anchor.constraint(equalTo: constrain.target, constant: constrain.amount).activate()
        }
        else if let constrain = constrain as? NSLayoutYAxisAnchor {
            anchor.constraint(equalTo: constrain).activate()
        }
        else if let view = constrain as? UIView {
            anchor.constraint(equalTo: view.layoutAnchor(target)).activate()
        }
        else if let constrain = constrain as? CGFloat {
            anchor.constraint(equalTo: base.superview!.layoutAnchor(target), constant: constrain).activate()
        }
        else if let constrain = constrain as? Int {
            anchor.constraint(equalTo: base.superview!.layoutAnchor(target), constant: CGFloat(constrain)).activate()
        }
    }
    
    
    func activateLayoutAnchorDimension(_ constrain: DimensionalConstraints, target: LayoutTarget.Dimension) {
        
        let anchor = base.layoutAnchor(target)
        if let constrain = constrain as? AnchorCalculable<NSLayoutDimension> {
            anchor.constraint(equalTo: constrain.target, multiplier: 1, constant: constrain.amount).activate()
        }
        else if let constrain = constrain as? NSLayoutDimension {
            anchor.constraint(equalTo: constrain).activate()
        }
        else if let view = constrain as? UIView {
            anchor.constraint(equalTo: view.layoutAnchor(target), multiplier: 1).activate()
        }
        else if let constant = constrain as? CGFloat {
            anchor.constraint(equalToConstant: constant).activate()
        }
        else if let constant = constrain as? Int {
            anchor.constraint(equalToConstant: CGFloat(constant)).activate()
        }
    }
}


extension LayoutMaker {
    
    
    func LayoutX(left: HorizontalConstraints, right: HorizontalConstraints) {
        activateLayoutAnchorXAxis(left, target: .left)
        activateLayoutAnchorXAxis(right, target: .right)
    }
    
    func LayoutX(right: HorizontalConstraints, width: DimensionalConstraints) {
        activateLayoutAnchorXAxis(right, target: .right)
        activateLayoutAnchorDimension(width, target: .width)
    }
    
    func LayoutX(left: HorizontalConstraints, width: DimensionalConstraints) {
        activateLayoutAnchorXAxis(left, target: .left)
        activateLayoutAnchorDimension(width, target: .width)
    }
    
    func LayoutX(centerX: HorizontalConstraints, width: DimensionalConstraints) {
        activateLayoutAnchorXAxis(centerX, target: .centerX)
        activateLayoutAnchorDimension(width, target: .width)
    }
}

extension LayoutMaker {
    
    
    func LayoutY(top: VerticalConstraints, bottom: VerticalConstraints) {
        activateLayoutAnchorYAxis(top, target: .top)
        activateLayoutAnchorYAxis(bottom, target: .bottom)
    }
    
    func LayoutY(top: VerticalConstraints, height: DimensionalConstraints) {
        activateLayoutAnchorYAxis(top, target: .top)
        activateLayoutAnchorDimension(height, target: .height)
    }
    
    func LayoutY(bottom: VerticalConstraints, height: DimensionalConstraints) {
        activateLayoutAnchorYAxis(bottom, target: .bottom)
        activateLayoutAnchorDimension(height, target: .height)
    }
    
    func LayoutY(centerY: VerticalConstraints, height: DimensionalConstraints) {
        activateLayoutAnchorYAxis(centerY, target: .centerY)
        activateLayoutAnchorDimension(height, target: .height)
    }
}

extension LayoutMaker {
    
    @discardableResult
    func width(_ width: DimensionalConstraints) -> LayoutMaker {
        activateLayoutAnchorDimension(width, target: .width)
        return self
    }
    
    @discardableResult
    func height(_ height: DimensionalConstraints) -> LayoutMaker {
        activateLayoutAnchorDimension(height, target: .height)
        return self
    }
}

extension LayoutMaker {
    
    @discardableResult
    func left(_ left: HorizontalConstraints) -> LayoutMaker {
        activateLayoutAnchorXAxis(left, target: .left)
        return self
    }
    
    @discardableResult
    func right(_ right: HorizontalConstraints) -> LayoutMaker {
        activateLayoutAnchorXAxis(right, target: .right)
        return self
    }
    
    @discardableResult
    func centerX(_ centerX: HorizontalConstraints) -> LayoutMaker {
        activateLayoutAnchorXAxis(centerX, target: .centerX)
        return self
    }
}

extension LayoutMaker {
    
    @discardableResult
    func top(_ top: VerticalConstraints) -> LayoutMaker {
        activateLayoutAnchorYAxis(top, target: .top)
        return self
    }
    
    @discardableResult
    func bottom(_ bottom: VerticalConstraints) -> LayoutMaker {
        activateLayoutAnchorYAxis(bottom, target: .bottom)
        return self
    }
    
    @discardableResult
    func centerY(_ centerY: VerticalConstraints) -> LayoutMaker {
        activateLayoutAnchorYAxis(centerY, target: .centerY)
        return self
    }
}
