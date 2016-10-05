//
//  ViewController.swift
//  UIImageViewModeScaleAspect
//
//  Created by Vivien Cormier on 06/07/16.
//  Copyright © 2016 Vivien Cormier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myImage = UIImageViewModeScaleAspect(frame: CGRect(x: 0, y: 100, width: 200, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        myImage.image = UIImage(named: "Octocat")
        myImage.contentMode = .scaleAspectFill
        myImage.backgroundColor = UIColor.black
        view.addSubview(myImage)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.animateImage))
        myImage.addGestureRecognizer(tapGesture)

    }

    func animateImage() {

        if myImage.contentMode == .scaleAspectFill {
            myImage.animate( .fit, frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), duration: 0.4)
        } else {
            myImage.animate( .fill, frame: CGRect(x: 0, y: 100, width: 200, height: 100), duration: 0.4)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

