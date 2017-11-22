[![Twitter: @VivienCormier](https://img.shields.io/badge/contact-@VivienCormier-blue.svg?style=flat)](https://twitter.com/VivienCormier)
[![Build Status](https://travis-ci.org/VivienCormier/UIImageViewModeScaleAspect.svg)](https://travis-ci.org/VivienCormier/UIImageViewModeScaleAspect)
[![codecov](https://codecov.io/gh/VivienCormier/UIImageViewModeScaleAspect/branch/master/graph/badge.svg)](https://codecov.io/gh/VivienCormier/UIImageViewModeScaleAspect)

UIImageViewModeScaleAspect (2.0)
================================

Create animation of a UIImageView between two contentMode ( `UIViewContentModeScaleAspectFill` / `UIViewContentModeScaleAspectFit` )
<a href="http://ios-developer.fr/" target="_blank">My WebSite</a> - <a href="https://twitter.com/VivienCormier" target="_blank">My Twitter</a>

Compatible Swift 3.0

Screenshot & Demo Video
-----------------------

To see a demo video, click <a href="http://www.youtube.com/watch?v=vZYbQ0Yt8eQ" target="_blank">here</a>
<a href="http://www.youtube.com/watch?v=vZYbQ0Yt8eQ" target="_blank">
  <img alt="ScreenShot Demo Video" src="https://github.com/VivienCormier/UIImageViewModeScaleAspect/blob/master/Example/UIImageViewModeScaleAspect/UIImageViewModeScaleAspect/example_1.png?raw=true" width="500" height="391" />
  <img alt="ScreenShot Demo Video" src="https://github.com/VivienCormier/UIImageViewModeScaleAspect/blob/master/Example/UIImageViewModeScaleAspect/UIImageViewModeScaleAspect/example_2.png?raw=true" width="500" height="391" />
</a>

How To Get Started
------------------

Use Pod (or download and add "UIImageViewModeScaleAspect.swift" in your xcodeproject.): 

```objective-c
pod 'UIImageViewModeScaleAspect'
```

Init the UIImageViewModeScaleAspect. Important ! Do not forget to init the contentMode :

```swift
let myImage = UIImageViewModeScaleAspect(frame: CGRect(x: 0, y: 100, width: 200, height: 100))
myImage.contentMode = .scaleAspectFill // Add the first contentMode
myImage.image = UIImage(named: "Octocat")
view.addSubview(myImage)
```

Automatic animation
-------------------

For convert `UIViewContentModeScaleAspectFill` to `UIViewContentModeScaleAspectFit`:

```swift
myImage.animate( .fit, frame: CGRect(x: 0, y: 0, width: 200, height: 200), duration: 0.4)
```

For convert `UIViewContentModeScaleAspectFit` to `UIViewContentModeScaleAspectFill`:

```swift
myImage.animate( .fill, frame: CGRect(x: 0, y: 0, width: 200, height: 200), duration: 0.4)
```

Manual animation
----------------

For convert `UIViewContentModeScaleAspectFill` to `UIViewContentModeScaleAspectFit`:

```swift
myImage.initialeState(.fit, newFrame: CGRect(x: 0, y: 100, width: 200, height: 100))

UIView.animate(withDuration: 0,4, delay: 0, options: .allowAnimatedContent, animations: {
  //
  // Others Animation
  //
  myImage.transitionState(.fit)
}, completion: { (finished) in
  myImage.endState(.fit)
})
```

For convert `UIViewContentModeScaleAspectFit` to `UIViewContentModeScaleAspectFill`:

```swift
myImage.initialeState(.fill, newFrame: CGRect(x: 0, y: 100, width: 200, height: 100))

UIView.animate(withDuration: 0,4, delay: 0, options: .allowAnimatedContent, animations: {
  //
  // Others Animation
  //
  myImage.transitionState(.fill)
}, completion: { (finished) in
  myImage.endState(.fill)
})
```
