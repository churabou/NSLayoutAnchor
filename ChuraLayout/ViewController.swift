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
    
    
    override func viewDidLoad() {
        
        
//        red.chura.constrainWith(view, view) { red, superView, _ in
//            red.LayoutX(left: superView.left, width: 300)
//            red.LayoutY(top: superView.top+50, height: 300)
//        }
        
//        blue.chura.constrainWith(red, view) { blue, red, superView in
//            blue.LayoutX(left: red.left, right: superView.right)
//            blue.LayoutY(top: red.bottom, bottom: superView.bottom)
//        }
        
        
        
        let red = UIView()
        red.backgroundColor = .red
        view.addSubview(red)
        
        let blue = UIView()
        blue.backgroundColor = .blue
        view.addSubview(blue)
        
        let green = UIView()
        green.backgroundColor = .green
        view.addSubview(green)
        
        let yellow = UIView()
        yellow.backgroundColor = .yellow
        view.addSubview(yellow)
        

        //just chainable layout makerで一度Fix
        LayoutMaker(red)
            .left(20).right(-20).top(50).height(30)
      
        LayoutMaker(blue)
            .left(red.anchor.left)
            .width(150)
            .height(150)
            .top(red.anchor.bottom+30)

        LayoutMaker(green)
            .right(red.anchor.right)
            .width(150)
            .height(150)
            .top(blue.anchor.top)
        
        LayoutMaker(yellow)
            .width(view.anchor.width - 100)
            .centerX(0)
            .height(50)
            .top(green.anchor.bottom + 30)
    }
}

