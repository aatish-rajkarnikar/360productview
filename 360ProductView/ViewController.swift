//
//  ViewController.swift
//  360ProductView
//
//  Created by Aatish Rajkarnikar on 8/18/17.
//  Copyright © 2017 Aatish Rajkarnikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var currentIndex: Int = 0{
        didSet{
            imageView.image = images[currentIndex]
        }
    }
    var images: [UIImage] = [UIImage]()
    var lastPoint: CGPoint = CGPoint.zero
    let sensitivity: CGFloat = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 2...65 {
            images.append(UIImage(named: "\(i)")!)
        }
        currentIndex = 0
    }

    @IBAction func gesture(_ sender: UIPanGestureRecognizer) {
        let currentPoint = sender.location(in: imageView)
        if sender.state == .began{
            lastPoint = currentPoint
        }else if sender.state == .changed {
            let velocity = sender.velocity(in: imageView)
            if velocity.x > 0 && currentPoint.x > lastPoint.x + sensitivity{
                currentIndex = currentIndex > 0 ? currentIndex - 1 : images.count - 1
                lastPoint = currentPoint
            }else{
                if currentPoint.x < lastPoint.x - sensitivity {
                    currentIndex = currentIndex < images.count - 1 ? currentIndex + 1 : 0
                    lastPoint = currentPoint
                }
            }
        }
    }

}

