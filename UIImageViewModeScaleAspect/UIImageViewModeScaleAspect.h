//
//  UIImageViewModeScaleAspect.m
//
// http://www.viviencormier.fr/
//
//  Created by Vivien Cormier on 02/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageViewModeScaleAspect : UIImageView

//
//
//

- (void)animateToScaleAspectFitToFrame:(CGRect)frame WithDuration:(float)duration afterDelay:(float)delay;

- (void)animateToScaleAspectFillToFrame:(CGRect)frame WithDuration:(float)duration afterDelay:(float)delay;




- (void)initToScaleAspectFitToFrame:(CGRect)newFrame;

- (void)initToScaleAspectFillToFrame:(CGRect)newFrame;


- (void)animaticToScaleAspectFit;

- (void)animaticToScaleAspectFill;


- (void)animateFinishToScaleAspectFit;

- (void)animateFinishToScaleAspectFill;

@end