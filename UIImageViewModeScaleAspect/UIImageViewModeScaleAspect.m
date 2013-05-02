//
//  UIImageViewModeScaleAspect.m
//
// http://www.viviencormier.fr/
//
//  Created by Vivien Cormier on 02/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import "UIImageViewModeScaleAspect.h"

@implementation UIImageViewModeScaleAspect

#pragma mark - Init

- (id)init {
    self = [super init];
    if (self) {
        
        img                    = [[UIImageView alloc]init];
        img.autoresizingMask   = UIViewContentModeCenter;
        [self addSubview:img];
        
        self.clipsToBounds = YES;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        img                    = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        img.autoresizingMask   = UIViewContentModeCenter;
        [self addSubview:img];
        
        self.clipsToBounds = YES;
    }
    return self;
}

#pragma mark - Automatic Animate

- (void)animateToScaleAspectFitToFrame:(CGRect)frame WithDuration:(float)duration afterDelay:(float)delay{
    
    if (![self uiimageIsEmpty]) {
        [self initToScaleAspectFitToFrame:frame];
        
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             [self animaticToScaleAspectFit];
                         } completion:nil];
    }else{
        NSLog(@"ERROR, UIImageView %@ don't have UIImage",self);
    }
    
    
}

- (void)animateToScaleAspectFillToFrame:(CGRect)frame WithDuration:(float)duration afterDelay:(float)delay{
    
    if (![self uiimageIsEmpty]) {
        
        [self initToScaleAspectFillToFrame:frame];
        
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             [self animaticToScaleAspectFill];
                         } completion:^(BOOL finished) {
                             [self animateFinishToScaleAspectFill];
                         }];
    }else{
        NSLog(@"ERROR, UIImageView %@ don't have UIImage",self);
    }
    
}

#pragma mark - Manual Animate

#pragma mark - - Init Function

- (void)initToScaleAspectFitToFrame:(CGRect)newFrame{
    
    if (![self uiimageIsEmpty]) {
        
        float ratio = (img.image.size.width) / (img.image.size.height);
        
        if (self.frame.size.width * ratio > self.frame.size.width) {
            img.frame = CGRectMake( - (self.frame.size.width * ratio - self.frame.size.width) / 2.0f, 0, self.frame.size.width * ratio, self.frame.size.height);
        }else{
            img.frame = CGRectMake(0, - (self.frame.size.width / ratio - self.frame.size.height) / 2.0f, self.frame.size.width, self.frame.size.width / ratio);
        }
    }else{
        NSLog(@"ERROR, UIImageView %@ don't have UIImage",self);
    }
    
    img.contentMode = UIViewContentModeScaleAspectFit;
    
    newFrameImg = CGRectMake(0, 0, newFrame.size.width, newFrame.size.height);
    newFrameWrapper = newFrame;
    
}

- (void)initToScaleAspectFillToFrame:(CGRect)newFrame{
    
    if (![self uiimageIsEmpty]) {
        
        float ratio = (img.image.size.width) / (img.image.size.height);
        
        if (newFrame.size.width * ratio > newFrame.size.width) {
            newFrameImg = CGRectMake( - (newFrame.size.width * ratio - newFrame.size.width) / 2.0f, 0, newFrame.size.width * ratio, newFrame.size.height);
        }else{
            newFrameImg = CGRectMake(0, - (newFrame.size.width / ratio - newFrame.size.height) / 2.0f, newFrame.size.width, newFrame.size.width / ratio);
        }
    }else{
        NSLog(@"ERROR, UIImageView %@ don't have UIImage",self);
    }
    
    newFrameWrapper = newFrame;
    
}

#pragma mark - - Animatic Function

- (void)animaticToScaleAspectFit{
    
    img.frame = newFrameImg;
    [self setFrameWrapper:newFrameWrapper];
    
}

- (void)animaticToScaleAspectFill{
    
    img.frame = newFrameImg;
    [self setFrameWrapper:newFrameWrapper];
    
}

#pragma mark - - Last Function

- (void)animateFinishToScaleAspectFit{
    
    //
    // Fake function
    //
    
}

- (void)animateFinishToScaleAspectFill{
    
    img.contentMode = UIViewContentModeScaleAspectFill;
    img.frame  = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
}

#pragma mark - Rewrite Setter / Getter

- (void)setImage:(UIImage *)image{
    
    img.image = image;
    
}

- (UIImage *)image{
    
    return img.image;
    
}

- (void)setContentMode:(UIViewContentMode)contentMode{
    
    img.contentMode = contentMode;
    
}

- (UIViewContentMode)contentMode{
    
    return img.contentMode;
    
}

- (void)setFrame:(CGRect)frame{
    
    [super setFrame:frame];
    img.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

- (void)setFrameWrapper:(CGRect)frame{
    
    [super setFrame:frame];
    
}

#pragma marf - Private Funcion

- (BOOL)uiimageIsEmpty{
    
    CGImageRef cgref = [img.image CGImage];
    CIImage *cim = [img.image  CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        return true;
    }else{
        return false;
    }
    
}

@end
