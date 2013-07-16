//
//  UIImageViewModeScaleAspect.m
//
// http://www.viviencormier.fr/
//
//  Created by Vivien Cormier on 02/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import "UIImageViewModeScaleAspect.h"

@interface UIImageViewModeScaleAspect ()

@property (nonatomic, readwrite) CGRect newFrameWrapper;
@property (nonatomic, readwrite) CGRect newFrameImg;
@property (nonatomic) UIImageView *img;


@end

@implementation UIImageViewModeScaleAspect

#pragma mark - Init

- (id)init {
    self = [super init];
    if (self) {
        
        self.img             = [[UIImageView alloc]init];
        self.img.contentMode = UIViewContentModeCenter;
        [self addSubview:_img];
        
        self.clipsToBounds = YES;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.img             = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.img.contentMode = UIViewContentModeCenter;
        [self addSubview:_img];
        
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
        
        float ratioImg = (_img.image.size.width) / (_img.image.size.height);
        
        if ([self choiseFunctionWithRationImg:ratioImg ForFrame:self.frame]) {
            self.img.frame = CGRectMake( - (self.frame.size.height * ratioImg - self.frame.size.width) / 2.0f, 0, self.frame.size.height * ratioImg, self.frame.size.height);
        }else{
            self.img.frame = CGRectMake(0, - (self.frame.size.width / ratioImg - self.frame.size.height) / 2.0f, self.frame.size.width, self.frame.size.width / ratioImg);
        }
    }else{
        NSLog(@"ERROR, UIImageView %@ don't have UIImage",self);
    }
    
    _img.contentMode = UIViewContentModeScaleAspectFit;
    
    self.newFrameImg = CGRectMake(0, 0, newFrame.size.width, newFrame.size.height);
    self.newFrameWrapper = newFrame;
    
}

- (void)initToScaleAspectFillToFrame:(CGRect)newFrame{
    
    if (![self uiimageIsEmpty]) {
        
        float ratioImg = (_img.image.size.width) / (_img.image.size.height);
        
        if ([self choiseFunctionWithRationImg:ratioImg ForFrame:newFrame]) {
            self.newFrameImg = CGRectMake( - (newFrame.size.height * ratioImg - newFrame.size.width) / 2.0f, 0, newFrame.size.height * ratioImg, newFrame.size.height);
        }else{
            self.newFrameImg = CGRectMake(0, - (newFrame.size.width / ratioImg - newFrame.size.height) / 2.0f, newFrame.size.width, newFrame.size.width / ratioImg);
        }
    }else{
        NSLog(@"ERROR, UIImageView %@ don't have UIImage",self);
    }
    
    self.newFrameWrapper = newFrame;
    
}

#pragma mark - - Animatic Function

- (void)animaticToScaleAspectFit{
    
    self.img.frame = _newFrameImg;
    [self setFrameWrapper:_newFrameWrapper];
    
}

- (void)animaticToScaleAspectFill{
    
    self.img.frame = _newFrameImg;
    [self setFrameWrapper:_newFrameWrapper];
    
}

#pragma mark - - Last Function

- (void)animateFinishToScaleAspectFit{
    
    //
    // Fake function
    //
    
}

- (void)animateFinishToScaleAspectFill{
    
    self.img.contentMode = UIViewContentModeScaleAspectFill;
    self.img.frame  = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
}

#pragma mark - Rewrite Setter / Getter

- (void)setImage:(UIImage *)image{
    
    self.img.image = image;
    
}

- (UIImage *)image{
    
    return _img.image;
    
}

- (void)setContentMode:(UIViewContentMode)contentMode{
    
    self.img.contentMode = contentMode;
    
}

- (UIViewContentMode)contentMode{
    
    return _img.contentMode;
    
}

- (void)setFrame:(CGRect)frame{
    
    [super setFrame:frame];
    self.img.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

- (void)setFrameWrapper:(CGRect)frame{
    
    [super setFrame:frame];
    
}

#pragma marf - Private Funcion

- (BOOL)uiimageIsEmpty{
    
    CGImageRef cgref = [_img.image CGImage];
    CIImage *cim = [_img.image  CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        return true;
    }else{
        return false;
    }
    
}

- (BOOL)choiseFunctionWithRationImg:(float)ratioImg ForFrame:(CGRect)newFrame{
    
    BOOL resultat = false;
    
    float ratioSelf = (newFrame.size.width) / (newFrame.size.height);
    
    if (ratioImg < 1) {
        if (ratioImg > ratioSelf ) resultat = true;
    }else{
        if (ratioImg > ratioSelf ) resultat = true;
    }
    
    return resultat;
    
}

@end
