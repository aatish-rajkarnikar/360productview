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
    var startIndex = 2
    var endIndex = 65
    var currentIndex = 2{
        didSet{
            imageView.image = UIImage(named: "\(currentIndex)")
        }
    }
    var lastPoint = CGPoint.zero

    @IBAction func gesture(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began{
            lastPoint = sender.location(in: imageView)
        }else if sender.state == .changed {
            let velocity = sender.velocity(in: imageView)
            if velocity.x > 0 {
                if (sender.location(in: imageView).x > lastPoint.x + 5){
                    lastPoint = sender.location(in: imageView)
                    if currentIndex > startIndex{
                        currentIndex -= 1
                    }else{
                        currentIndex = endIndex
                    }
                }
            }else{
                if (sender.location(in: imageView).x < lastPoint.x - 5){
                    lastPoint = sender.location(in: imageView)
                    if currentIndex < endIndex{
                        currentIndex += 1
                    }else{
                        currentIndex = startIndex
                    }
                }
            }
        }
    }

}

