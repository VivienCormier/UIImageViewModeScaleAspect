//
//  UIImageViewModeScaleAspect.swift
//  UIImageViewModeScaleAspect
//
//  Created by Vivien Cormier on 06/07/16.
//  Copyright © 2016 Vivien Cormier. All rights reserved.
//

import UIKit

class UIImageViewModeScaleAspect: UIView {
    
    enum ScaleAspect {
        case Fit
        case Fill
    }
    
    var image: UIImage? {
        didSet {
            transitionImage.image = image
        }
    }
    
    private var transitionImage: UIImageView
    private var newTransitionImageFrame: CGRect?
    private var newSelfFrame: CGRect?
    
    required init?(coder aDecoder: NSCoder) {
        
        transitionImage = UIImageView()
        transitionImage.contentMode = .Center
        
        super.init(coder: aDecoder)
        
        addSubview(transitionImage)
        clipsToBounds = true
        
    }
    
    override init(frame: CGRect) {
        
        transitionImage = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        transitionImage.contentMode = .ScaleAspectFit;
        
        super.init(frame: frame)
        
        addSubview(transitionImage)
        clipsToBounds = true
        
    }
    
    //MARK: Automatic animations
    
    func animate(scaleAspect: ScaleAspect, frame: CGRect, duration: Double, delay: Double) -> Void {
        
        if transitionImage.image == nil {
            //TODO: Manage error
            return
        }
        
        initialeState(scaleAspect, newFrame: frame)
        
        UIView.animateWithDuration(duration, delay: delay, options: .AllowAnimatedContent, animations: {
            self.transitionState(scaleAspect)
        }, completion: { (finished) in
            self.endState(scaleAspect)
        })
        
    }
    
    //MARK: Manual animations
    
    func initialeState(newScaleAspect: ScaleAspect, newFrame: CGRect) -> Void {
        
        if transitionImage.image == nil {
            //TODO: Manage error
            return
        }
        
        if newScaleAspect == ScaleAspect.Fill && contentMode == .ScaleAspectFill {
            //TODO: Manage error
        }
        
        if newScaleAspect == ScaleAspect.Fit && contentMode == .ScaleAspectFit {
            //TODO: Manage error
        }
        
        let ratio = transitionImage.image!.size.width / transitionImage.image!.size.height
        
        if newScaleAspect == ScaleAspect.Fill {
            newTransitionImageFrame = initialeTransitionImageFrame(newScaleAspect, ratio: ratio, newFrame: newFrame)
        } else {
            transitionImage.frame = initialeTransitionImageFrame(newScaleAspect, ratio: ratio, newFrame: frame)
            transitionImage.contentMode = UIViewContentMode.ScaleAspectFit;
            newTransitionImageFrame = CGRectMake(0, 0, newFrame.size.width, newFrame.size.height);
        }
        
        // Maybe update self frame ?
        newSelfFrame = newFrame
        
    }
    
    func transitionState(scaleAspect: ScaleAspect) -> Void {
        transitionImage.frame = newTransitionImageFrame!
        super.frame = newSelfFrame!
    }
    
    func endState(scaleAspect: ScaleAspect) -> Void {
        if scaleAspect == ScaleAspect.Fill {
            transitionImage.contentMode = .ScaleAspectFill;
            transitionImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        }
    }
    
    //MARK: Override
    
    override var frame: CGRect {
        didSet {
            transitionImage.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        }
    }
    
    override var contentMode: UIViewContentMode {
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
