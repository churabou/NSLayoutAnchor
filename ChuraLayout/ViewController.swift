//
//  ViewController.swift
//  AltAutoLayout
//
//  Created by ちゅーたつ on 2018/03/30.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//



import UIKit




class ChuraLayout {
    
    var target: UIView
    
    init (_ target: UIView) {
        self.target = target
    }
    
    func constrainWith(_ view1: UIView, _ view2: UIView, closure: ((LayoutMaker, AnchorShortcut, AnchorShortcut)->Swift.Void)) {
        closure(LayoutMaker(target), AnchorShortcut(view1), AnchorShortcut(view2))
    }
}


extension UIView {
    
    var chura: ChuraLayout {
        return ChuraLayout(self)
    }
    
    var anchor: AnchorShortcut {
        return AnchorShortcut(self)
    }
}


class ViewController: UIViewController {
    
    let red = UIView()
    let blue = UIView()
    let green = UIView()
    
    
    override func viewDidLoad() {
        
        
        view.addSubview(red)
        view.addSubview(blue)
        view.addSubview(green)
        
        red.backgroundColor = .red
        blue.backgroundColor = .blue
        green.backgroundColor = .green
        
        red.translatesAutoresizingMaskIntoConstraints = false
        blue.translatesAutoresizingMaskIntoConstraints = false
        green.translatesAutoresizingMaskIntoConstraints = false
        
        
        red.chura.constrainWith(view, view) { red, superView, _ in
            red.LayoutX(left: superView.left, width: CGFloat(300))
            red.LayoutY(top: superView.top+50, height: CGFloat(300))
        }
        
        blue.chura.constrainWith(red, view) { blue, red, superView in
            blue.LayoutX(left: red.left, right: superView.right)
            blue.LayoutY(top: red.bottom, bottom: superView.bottom)
        }
        
        
        //just chainable layout makerで一度Fix
        LayoutMaker(green)
            .width(view.anchor.width + (-30))
            .height(CGFloat(100))
            .centerY(view.anchor.centerY)
            .centerX(view.anchor.centerX)
    }
}

