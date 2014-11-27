---
title: CSS に慣れた人が iOS で見た目を少し変えたい時に少し面倒だった事例 × 2
date: 2014-11-27 22:41 JST
---

CSS だと1行で簡単にできるから iOS でも簡単にできるんだろうな〜 Interface Builder もあるしな〜とか思ってると意外とそう簡単にはいかないということがあったので、せっかくのまだ iOS 開発に触れて間もないフレッシュな時期に書き残しておこうと思います。

## 複数行ラベルの行間を変更したい

![](https://cloud.githubusercontent.com/assets/2177378/5217680/0e16a4ee-7687-11e4-8b1c-afd60e94f584.png)

### CSS なら

```css
line-height: 1.5;
```

### iOS の場合

numberOfLines が適当に指定されていて、`text` プロパティにコード上で値を代入しているような `label: UILabel` があるとして、

#### Objective-C

```obj-c
CGFloat lineHeightMultiple = 1.5;

NSMutableAttributedString *attributedString = [label.attributedText mutableCopy];

NSMutableParagraphStyle *paragrahStyle = [NSMutableParagraphStyle new];
paragrahStyle.lineHeightMultiple = lineHeightMultiple;

[attributedString addAttribute:NSParagraphStyleAttributeName
                         value:paragrahStyle
                         range:NSMakeRange(0, attributedString.length)];

[label setAttributedText:attributedString];
```

#### Swift

```swift
let lineHeightMultiple: CGFloat = 1.5

let attributedString = label.attributedText.mutableCopy() as NSMutableAttributedString

let paragraphStyle = NSMutableParagraphStyle()
paragraphStyle.lineHeightMultiple = lineHeightMultiple;

attributedString.addAttribute(
    NSParagraphStyleAttributeName,
    value: paragraphStyle,
    range: NSMakeRange(0, attributedString.length))

label.attributedText = attributedString
```

#### 長いので UILabel のカテゴリを作った

https://gist.github.com/tdksk/d547fa69820bc4b7860a

```obj-c
[label setLineHeightMultiple:1.5];
```

みたいな感じでいけます。

## 全部じゃなくて一部角丸にしたい

![](https://cloud.githubusercontent.com/assets/2177378/5217679/0e10ef04-7687-11e4-88eb-9e165bbf5710.png)

### CSS なら

```css
border-radius: 4px 4px 0 0;
```

### iOS の場合

`view: UIView` を角丸にしたいとき、全て角丸なら `view.layer.cornerRadius = 4.0` とかで簡単にできるのですが、一部角丸にしたい場合は1行ではいかなくて、

#### Objective-C

```obj-c
CGFloat cornerRadius = 4.0;
UIRectCorner corners = UIRectCornerTopLeft | UIRectCornerTopRight

[view layoutIfNeeded];

UIBezierPath *maskPath;
maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                 byRoundingCorners:corners
                                       cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];

CAShapeLayer *maskLayer = [CAShapeLayer new];
maskLayer.frame = view.bounds;
maskLayer.path = maskPath.CGPath;

view.layer.mask = maskLayer;
```

#### Swift

```swift
let cornerRadius: CGFloat = 4.0
let corners = UIRectCorner.TopLeft | UIRectCorner.TopRight

view.layoutIfNeeded()

let maskPath = UIBezierPath(
    roundedRect: view.bounds,
    byRoundingCorners: corners,
    cornerRadii: CGSizeMake(cornerRadius, cornerRadius))

let maskLayer = CAShapeLayer()
maskLayer.frame = view.bounds
maskLayer.path = maskPath.CGPath

view.layer.mask = maskLayer
```

#### 長いので UIView のカテゴリを作った

https://gist.github.com/tdksk/21f6b821011398cc74f8

```obj-c
[view maskByRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
               cornerRadius:4.0];
```

場所毎に角丸の大きさ変えたいケースが今までほぼなかったので大きさは固定です。

## 所感

View まわりのコード書くとき Swift だと速く書けるので Swift 好きです。

Swift で遊んでみたときのコードは [こちら](https://gist.github.com/tdksk/22ab94687e4a8103edc2) 。
