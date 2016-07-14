//
//  UIImageViewModeScaleAspectTests.swift
//  UIImageViewModeScaleAspectTests
//
//  Created by Vivien Cormier on 06/07/16.
//  Copyright © 2016 Vivien Cormier. All rights reserved.
//

import XCTest
@testable import UIImageViewModeScaleAspect

class UIImageViewModeScaleAspectTests: XCTestCase {

    var imagePortrait = UIImage(named: "Image-100x200")
    var imageLandscape = UIImage(named: "Image-200x100")

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testScaleAspectFitToFillWithLandscapeImage() {

        let initialeFrame = CGRectMake(0, 0, 100, 100)
        let finalFrame = CGRectMake(0, 0, 100, 100)

        let imageViewModeScaleAscpect = UIImageViewModeScaleAspect(frame: initialeFrame)
        imageViewModeScaleAscpect.image = imageLandscape
        imageViewModeScaleAscpect.contentMode = .ScaleAspectFit

        imageViewModeScaleAscpect.initialeState(.Fill, newFrame: finalFrame)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, initialeFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, initialeFrame.height)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.transitionState(.Fill)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, imageViewModeScaleAscpect.image?.size.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, imageViewModeScaleAscpect.image?.size.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, -50)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.endState(.Fill)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, finalFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, finalFrame.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFill)

    }

    func testScaleAspectFillToFitWithLandscapeImage() {

        let initialeFrame = CGRectMake(0, 0, 100, 100)
        let finalFrame = CGRectMake(0, 0, 100, 100)

        let imageViewModeScaleAscpect = UIImageViewModeScaleAspect(frame: initialeFrame)
        imageViewModeScaleAscpect.image = imageLandscape
        imageViewModeScaleAscpect.contentMode = .ScaleAspectFill

        imageViewModeScaleAscpect.initialeState(.Fit, newFrame: finalFrame)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, imageViewModeScaleAscpect.image?.size.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, imageViewModeScaleAscpect.image?.size.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, -50)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.transitionState(.Fit)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, finalFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, finalFrame.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.endState(.Fit)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, finalFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, finalFrame.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)

    }

    func testScaleAspectFitToFillWithPortraitImage() {

        let initialeFrame = CGRectMake(0, 0, 100, 100)
        let finalFrame = CGRectMake(0, 0, 100, 100)

        let imageViewModeScaleAscpect = UIImageViewModeScaleAspect(frame: initialeFrame)
        imageViewModeScaleAscpect.image = imagePortrait
        imageViewModeScaleAscpect.contentMode = .ScaleAspectFit

        imageViewModeScaleAscpect.initialeState(.Fill, newFrame: finalFrame)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, initialeFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, initialeFrame.height)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.transitionState(.Fill)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, imageViewModeScaleAscpect.image?.size.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, imageViewModeScaleAscpect.image?.size.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, -50)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.endState(.Fill)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, finalFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, finalFrame.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFill)

    }

    func testScaleAspectFillToFitWithPortraitImage() {

        let initialeFrame = CGRectMake(0, 0, 100, 100)
        let finalFrame = CGRectMake(0, 0, 100, 100)

        let imageViewModeScaleAscpect = UIImageViewModeScaleAspect(frame: initialeFrame)
        imageViewModeScaleAscpect.image = imagePortrait
        imageViewModeScaleAscpect.contentMode = .ScaleAspectFill

        imageViewModeScaleAscpect.initialeState(.Fit, newFrame: finalFrame)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, imageViewModeScaleAscpect.image?.size.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, imageViewModeScaleAscpect.image?.size.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, -50)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.transitionState(.Fit)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, finalFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, finalFrame.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)
        imageViewModeScaleAscpect.endState(.Fit)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.width, finalFrame.width)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.height, finalFrame.height)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.x, 0)
        XCTAssertEqual(imageViewModeScaleAscpect.transitionImage.frame.origin.y, 0)
        XCTAssert(imageViewModeScaleAscpect.contentMode == .ScaleAspectFit)

    }
    
}
