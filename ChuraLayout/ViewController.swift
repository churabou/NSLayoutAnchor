//
//  ViewController.swift
//  AltAutoLayout
//
//  Created by ちゅーたつ on 2018/03/30.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//



import UIKit


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        let red = UIView()
        red.backgroundColor = .red
        view.addSubview(red)
        
        let blue = UIView()
        blue.backgroundColor = .blue
        view.addSubview(blue)
        
        let orange = UIView()
        orange.backgroundColor = .orange
        view.addSubview(orange)
        
        
        let green = UIView()
        green.backgroundColor = .green
        view.addSubview(green)
        
        let yellow = UIView()
        yellow.backgroundColor = .yellow
        view.addSubview(yellow)
        
        // most simple
        red.chura.layout.equalToSuperView()
        blue.chura.layout.size(200).center(0)
        
        yellow.chura.layout
            .top(blue).height(100)
            .left(10).width(50)
        
        // operator
        orange.chura.layout
            .top(view.safeAreaLayoutGuide.topAnchor+10).height(view.heightAnchor/5)
            .left(view.leftAnchor+10).right(view.rightAnchor-10)
        
        // relation
        green.chura.layout
            .top(anchor: orange.bottomAnchor, offSet: 20)
            .bottom(anchor: blue.topAnchor, offSet: -20)
            .right(anchor: view.rightAnchor, offSet: -10)
            .width(anchor: blue.widthAnchor, multiplier: 1/3)
    }
}

