//
//  ViewController.swift
//  UIImageViewModeScaleAspect
//
//  Created by Vivien Cormier on 06/07/16.
//  Copyright © 2016 Vivien Cormier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myImage = UIImageViewModeScaleAspect(frame: CGRectMake(0, 100, 200, 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        myImage.image = UIImage(named: "Octocat")
        myImage.contentMode = .ScaleAspectFill
        myImage.backgroundColor = UIColor.blackColor()
        view.addSubview(myImage)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.animateImage))
        myImage.addGestureRecognizer(tapGesture)

    }

    func animateImage() {

        if myImage.contentMode == .ScaleAspectFill {
            myImage.animate( .Fit, frame: CGRectMake(0, 0, view.frame.width, view.frame.height), duration: 0.4)
        } else {
            myImage.animate( .Fill, frame: CGRectMake(0, 100, 200, 100), duration: 0.4)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

