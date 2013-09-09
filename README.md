UIImageViewModeScaleAspect (1.2)
================================

<p>Create animation of a UIImageView between two contentMode ( UIViewContentModeScaleAspectFill / UIViewContentModeScaleAspectFit )</p>
<a href="http://www.alexruperez.com/" target="_blank">My WebSite</a>

Screenshot & Demo Video
-----------------------

<p>To see a demo video, click <a href="http://www.youtube.com/watch?v=vZYbQ0Yt8eQ" target="_blank">here</a></p>
<a href="http://www.youtube.com/watch?v=vZYbQ0Yt8eQ" target="_blank">
  <img alt="ScreenShot Demo Video" src="https://github.com/alexruperez/UIImageViewModeScaleAspect/blob/master/Example/UIImageViewModeScaleAspect/UIImageViewModeScaleAspect/example_1.png?raw=true" width="500" height="391" />
  <img alt="ScreenShot Demo Video" src="https://github.com/alexruperez/UIImageViewModeScaleAspect/blob/master/Example/UIImageViewModeScaleAspect/UIImageViewModeScaleAspect/example_2.png?raw=true" width="500" height="391" />
</a>

How To Get Started
------------------

<p>Use Pod (or download and add "UIImageViewModeScaleAspect.h" and "UIImageViewModeScaleAspect.m" in your xcodeprojet.) : </p>

``` objective-c
pod 'UIImageViewModeScaleAspect'
```

<p>Import the .h file :</p>
``` objective-c
#import "UIImageViewModeScaleAspect.h"
```

<p>Init the UIImageViewModeScaleAspect. Important ! Do not forget to init the contentMode :</p>
``` objective-c
UIImageViewModeScaleAspect *myImage = [[UIImageViewModeScaleAspect alloc]initWithFrame:CGRectMake(50, 100, 200, 100)];
myImage.contentMode = UIViewContentModeScaleAspectFill; // Add the first contentMode
myImage.image = [UIImage imageNamed:@"becomeapanda_tumblr_com"];
myImage.backgroundColor = [UIColor blackColor];
[self.view addSubview:myImage];
```

Automatic animation
-------------------

<p>To switch between UIViewContentModeScaleAspectFill and UIViewContentModeScaleAspectFit simply :</p>
``` objective-c
[myImage animate];
```

Manual animation
----------------

<p>For convert UIViewContentModeScaleAspectFill to UIViewContentModeScaleAspectFit :</p>
``` objective-c
[myImage initToScaleAspectFillToFrame:CGRectMake(50, 100, 200, 100)];
        
[UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionAllowUserInteraction
                 animations:^{
                     //
                     // Others Animation
                     //
                     [myImage animaticToScaleAspectFill];
                     //
                     // Others Animation
                     //
                 } completion:^(BOOL finished) {
                     [myImage animateFinishToScaleAspectFill];
                 }];
```

<p>For convert UIViewContentModeScaleAspectFit to UIViewContentModeScaleAspectFill :</p>
``` objective-c
[myImage initToScaleAspectFitToFrame:CGRectMake(0, 0, 200, 200)];
        
[UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionAllowUserInteraction
                 animations:^{
                     //
                     // Others Animation
                     //
                     [myImage animaticToScaleAspectFit];
                     //
                     // Others Animation
                     //
                 } completion:^(BOOL finished) {
                     [myImage animateFinishToScaleAspectFit];
                 }];
```
