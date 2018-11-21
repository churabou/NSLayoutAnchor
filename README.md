# NSLayoutAnchor

NSLayoutAnchorをラップしたやつ。

### feature

- most simplest layout library

``` swift
        red.chura.layout.equalToSuperView()
        blue.chura.layout.size(200).center(0)
```

``` swift
        yellow.chura.layout
            .top(blue).height(100) // vertically
            .left(10).width(50) // horizontally
```

- arithmetic 

``` swift
        orange.chura.layout
            .top(view.safeAreaLayoutGuide.topAnchor+10).height(view.heightAnchor/5)
            .left(view.leftAnchor+10).right(view.rightAnchor-10)
```


- relation

``` swift
        green.chura.layout
            .top(anchor: orange.bottomAnchor, offSet: 20)
            .bottom(anchor: blue.topAnchor, offSet: -20)
            .right(anchor: view.rightAnchor, offSet: -10)
            .width(anchor: blue.widthAnchor, multiplier: 1/3)
```

<img src="https://github.com/churabou/NSLayoutAnchor/blob/master/demo.png" width="270" height="500">




### k


no need to set translatesAutoresizingMaskIntoConstraints (layout method automaticaly set)

```
  translatesAutoresizingMaskIntoConstraints = false
```

``` swift
   blue.chura.layout.top(20) 
```

actualy does

``` 
       blue.topAnchor.constraint(equalTo: blue.superview!.topAnchor, constant: 20)
```

if superView is nil, then fatalError() called



HorizontalConstraints(left, right, centerX) supports

``` swift
blue.chura.layout.left(20)   // Int, Float, Double, CGFloat
blue.chura.layout.left(view)   // UIView
blue.chura.layout.left(view.leftAnchor)   // NSLayoutXAxisAnchor
blue.chura.layout.left(view.leftAnchor+10)   // NSLayoutXAxisAnchor |+ -| constant
```

VerticalConstraints(top, bottom, centerY) supports

``` swift
blue.chura.layout.top(20)   // Int, Float, Double, CGFloat
blue.chura.layout.top(view)   // UIView
blue.chura.layout.top(view.topAnchor)   // NSLayoutYAxisAnchor
blue.chura.layout.top(view.topAnchor+10)   // NSLayoutYAxisAnchor |+ -| constant
```


DimensionalConstraints(width, height) supports

``` swift
blue.chura.layout.width(20)   // Int, Float, Double, CGFloat
blue.chura.layout.width(view)   // UIView 
blue.chura.layout.height(view.heightAnchor)   // NSLayoutDimension
blue.chura.layout.height(view.heightAnchor / 10)   // NSLayoutDimension |+ - * / | constant 
```
