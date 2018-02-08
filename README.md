# KLLayoutGuide

Porting UILayoutGuide to iOS 8+

### What is `UILayoutGuide`🤔

> A rectangular area that can interact with Auto Layout.

```swift
let space1 = UILayoutGuide()
view.addLayoutGuide(space1)

let space2 = UILayoutGuide()
view.addLayoutGuide(space2)

space1.widthAnchor.constraintEqualToAnchor(space2.widthAnchor).active = true
saveButton.trailingAnchor.constraintEqualToAnchor(space1.leadingAnchor).active = true
cancelButton.leadingAnchor.constraintEqualToAnchor(space1.trailingAnchor).active = true
cancelButton.trailingAnchor.constraintEqualToAnchor(space2.leadingAnchor).active = true
clearButton.leadingAnchor.constraintEqualToAnchor(space2.trailingAnchor).active = true
```

For detail see the [documentation](https://developer.apple.com/documentation/uikit/uilayoutguide)

### How to use on iOS 8?

`pod 'KLLayoutGuide'`

then just use `UILayoutGuide`
