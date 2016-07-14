//
//  UIImageViewModeScaleAspect.swift
//  UIImageViewModeScaleAspect
//
//  Created by Vivien Cormier on 06/07/16.
//  Copyright © 2016 Vivien Cormier. All rights reserved.
//

import UIKit

@IBDesignable
public class UIImageViewModeScaleAspect: UIView {
    
    public enum ScaleAspect {
        case Fit
        case Fill
    }
    
    @IBInspectable public var image: UIImage? {
        didSet {
            transitionImage.image = image
        }
    }
    
    internal var transitionImage: UIImageView
    private var newTransitionImageFrame: CGRect?
    private var newSelfFrame: CGRect?
    
    required public init?(coder aDecoder: NSCoder) {
        
        transitionImage = UIImageView()
        transitionImage.contentMode = .Center
        
        super.init(coder: aDecoder)

        addSubview(transitionImage)
        transitionImage.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        transitionImage.autoresizingMask = [ .FlexibleWidth, .FlexibleHeight]
        clipsToBounds = true
        
    }
    
    override public init(frame: CGRect) {
        
        transitionImage = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        transitionImage.contentMode = .ScaleAspectFit;
        
        super.init(frame: frame)
        
        addSubview(transitionImage)
        clipsToBounds = true
        
    }
    
    //MARK: Automatic animations

    /**
     Animate the UIImageView between to UIViewContentModeScaleAspect[Fill, Fit]

     - Parameters:
        - scaleAspect: Content mode that you want to change.
        - frame: Optional parameters. New frame you want to set to your image during the animation. If nil, only the scale aspect is changed.
        - duration: The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
        - delay: Optional parameters. The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
        - completion: Optional parameters. A block object to be executed when the animation sequence ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle. This parameter may be NULL.

     - Returns: Animated image.
     */
    public func animate(scaleAspect: ScaleAspect, frame: CGRect? = nil, duration: Double, delay: Double? = nil, completion: ((Bool) -> Void)? = nil) -> Void {

        var newFrame = self.frame
        if frame != nil {
            newFrame = frame!
        }

        initialeState(scaleAspect, newFrame: newFrame)

        var delayAnimation = 0.0
        if delay != nil {
            delayAnimation = delay!
        }
        
        UIView.animateWithDuration(duration, delay: delayAnimation, options: .AllowAnimatedContent, animations: {
            self.transitionState(scaleAspect)
        }, completion: { (finished) in
            self.endState(scaleAspect)
            completion?(finished)
        })
        
    }
    
    //MARK: Manual animations

    /**
     If you want to animate yourself the image, you need to call this function before the animation block.

     - Parameters:
        - scaleAspect: Content mode that you want to change.

     - Returns: New frame for the image
     */
    public func initialeState(newScaleAspect: ScaleAspect, newFrame: CGRect) -> Void {
        
        precondition(transitionImage.image != nil)
        
        if newScaleAspect == ScaleAspect.Fill && contentMode == .ScaleAspectFill ||
            newScaleAspect == ScaleAspect.Fit && contentMode == .ScaleAspectFit {
            print("UIImageViewModeScaleAspect - Warning : You are trying to animate your image to \(contentMode) but it's already set.")
        }
        
        let ratio = transitionImage.image!.size.width / transitionImage.image!.size.height
        
        if newScaleAspect == ScaleAspect.Fill {
            newTransitionImageFrame = initialeTransitionImageFrame(newScaleAspect, ratio: ratio, newFrame: newFrame)
        } else {
            transitionImage.frame = initialeTransitionImageFrame(newScaleAspect, ratio: ratio, newFrame: frame)
            transitionImage.contentMode = UIViewContentMode.ScaleAspectFit;
            newTransitionImageFrame = CGRectMake(0, 0, newFrame.size.width, newFrame.size.height);
        }

        newSelfFrame = newFrame
        
    }

    /**
     If you want to animate yourself the image, you need to call this function inside the animation block

     - Parameters:
        - scaleAspect: Content mode that you want to change.

     - Returns: New frame for the image
     */
    public func transitionState(scaleAspect: ScaleAspect) -> Void {
        transitionImage.frame = newTransitionImageFrame!
        super.frame = newSelfFrame!
    }

    /**
     If you want to animate yourself the image, you need to call this function in the completion block of the animation.

     - Parameters:
        - scaleAspect: Content mode that you want to change.

     - Returns: New frame for the image
     */
    public func endState(scaleAspect: ScaleAspect) -> Void {
        if scaleAspect == ScaleAspect.Fill {
            transitionImage.contentMode = .ScaleAspectFill;
            transitionImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        }
    }
    
    //MARK: Override
    
    override public var frame: CGRect {
        didSet {
            transitionImage.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        }
    }
    
    override public var contentMode: UIViewContentMode {
        get {
            return transitionImage.contentMode
        }
        set(newContentMode) {
            transitionImage.contentMode = newContentMode
        }
    }
    
    //MARK: Private
    
    private static func contentMode(scaleAspect: ScaleAspect) -> UIViewContentMode {
        switch scaleAspect {
        case .Fit:
            return UIViewContentMode.ScaleAspectFit
        case .Fill:
            return UIViewContentMode.ScaleAspectFill
        }
    }
    
    private func initialeTransitionImageFrame(scaleAspect: ScaleAspect, ratio: CGFloat, newFrame: CGRect) -> CGRect {
        
        var selectFrameFormula = false
        
        let ratioSelf = newFrame.size.width / newFrame.size.height
        
        if (ratio > ratioSelf ) {
            selectFrameFormula = true
        }
        
        if scaleAspect == ScaleAspect.Fill {

            if (selectFrameFormula) {
                return CGRectMake( -(newFrame.size.height * ratio - newFrame.size.width) / 2.0, 0, newFrame.size.height * ratio, newFrame.size.height)
            }else{
                return CGRectMake(0, -(newFrame.size.width / ratio - newFrame.size.height) / 2.0, newFrame.size.width, newFrame.size.width / ratio)
            }
            
        } else {

            if (selectFrameFormula) {
                return CGRectMake( -(frame.size.height * ratio - frame.size.width) / 2.0, 0, frame.size.height * ratio, frame.size.height)
            }else{
                return CGRectMake(0, -(frame.size.width / ratio - frame.size.height) / 2.0, frame.size.width, frame.size.width / ratio)
            }
            
        }
        
    }
    
}
