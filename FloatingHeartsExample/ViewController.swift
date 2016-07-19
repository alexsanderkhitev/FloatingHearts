//
//  ViewController.swift
//  FloatingHeartsExample
//
//  Created by Said Marouf on 4/20/16.
//  Copyright © 2016 Said Marouf. All rights reserved.
//

import UIKit
import FloatingHearts

class ViewController: UIViewController {

    private struct HeartAttributes {
        static let heartSize: CGFloat = 36
        static let burstDelay: NSTimeInterval = 0.1
    }

    var burstTimer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: 0xf2f4f6)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showTheLove))
        view.addGestureRecognizer(tapGesture)

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress))
        longPressGesture.minimumPressDuration = 0.2
        view.addGestureRecognizer(longPressGesture)
    }

    func didLongPress(longPressGesture: UILongPressGestureRecognizer) {
        switch longPressGesture.state {
        case .Began:
            burstTimer = NSTimer.scheduledTimerWithTimeInterval(HeartAttributes.burstDelay, target: self, selector: #selector(showTheLove), userInfo: nil, repeats: true)
        case .Ended, .Cancelled:
            burstTimer?.invalidate()
        default:
            break
        }
    }

    func showTheLove(gesture: UITapGestureRecognizer?) {
        let heart = HeartView(frame: CGRectMake(0, 0, HeartAttributes.heartSize, HeartAttributes.heartSize))
        view.addSubview(heart)
        let fountainX = HeartAttributes.heartSize / 2.0 + 20
        let fountainY = view.bounds.height / 2//- HeartAttributes.heartSize / 2.0 - 10
        heart.center = CGPoint(x: fountainX, y: fountainY)
        heart.animateInView(view)
    }
    
}
