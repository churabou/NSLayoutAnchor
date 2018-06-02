# NSLayoutAnchor


コードレイアウトを自分にとってもっと楽にしたい。
x軸に2つ制約がついたらY軸とかもっと工夫したい。
現状


``` .swift
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
```


``` .swift
        red.chura.layout
            .left(20).right(-20).top(50).height(30)
      
        blue.chura.layout
            .left(red.anchor.left)
            .width(150)
            .height(150)
            .top(red.anchor.bottom + 30)

        green.chura.layout
            .right(red.anchor.right)
            .width(150)
            .height(150)
            .top(blue.anchor.top)
        
        yellow.chura.layout
            .width(view.anchor.width - 100)
            .centerX(0)
            .height(50)
            .top(green.anchor.bottom + 30)

```


![](https://github.com/churabou/NSLayoutAnchor/blob/master/demo.png)
