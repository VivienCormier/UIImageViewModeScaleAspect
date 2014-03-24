//
//  ViewController.m
//  UIImageViewModeScaleAspect
//
//  Created by dvd on 02/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import "ViewController.h"
#import "UIImageViewModeScaleAspect.h"

@interface ViewController ()

@property (strong, nonatomic) UIImageViewModeScaleAspect *myImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    //Init UIImageViewModeScaleAspect
    //
    self.myImage = [[UIImageViewModeScaleAspect alloc]initWithFrame:CGRectMake(0, 100, 200, 100)];
    self.myImage.contentMode = UIViewContentModeScaleAspectFill; // Add the first contentMode
    self.myImage.image = [UIImage imageNamed:@"becomeapanda_tumblr_com"];
    self.myImage.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_myImage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(animateImage)];
    [self.view addGestureRecognizer:tap];
}

- (void)animateImage{
    
    ////////////////////////
    //
    // Use automatic function to animate
    //
    ////////////////////////
    
    if (self.myImage.contentMode == UIViewContentModeScaleAspectFit) {
        [self.myImage animateToScaleAspectFillToFrame:CGRectMake(0, 100, 200, 100) WithDuration:0.4f afterDelay:0.0f];
    }else{
        [self.myImage animateToScaleAspectFitToFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) WithDuration:0.4f afterDelay:0.0f];
    }
    
    ////////////////////////
    //
    // Or manual
    //
    ////////////////////////
    
//    if (self.myImage.contentMode == UIViewContentModeScaleAspectFit) {
//        
//        [self.myImage initToScaleAspectFillToFrame:CGRectMake(0, 100, 200, 100)];
//        
//        [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionAllowUserInteraction
//                         animations:^{
//                             //
//                             // Others Animation
//                             //
//                             [self.myImage animaticToScaleAspectFill];
//                             //
//                             // Others Animation
//                             //
//                         } completion:^(BOOL finished) {
//                             [self.myImage animateFinishToScaleAspectFill];
//                         }];
//    }else{
//        [self.myImage initToScaleAspectFitToFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        
//        [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionAllowUserInteraction
//                         animations:^{
//                             //
//                             // Others Animation
//                             //
//                             [self.myImage animaticToScaleAspectFit];
//                             //
//                             // Others Animation
//                             //
//                         } completion:^(BOOL finished) {
//                             [self.myImage animateFinishToScaleAspectFit];
//                         }];
//    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
