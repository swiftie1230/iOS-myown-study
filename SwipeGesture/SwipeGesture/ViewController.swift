//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 황서진 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {
    let numOfTouchs = 2

    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    
    var imgLeft = UIImage(systemName: "arrow.left")
    var imgRight = UIImage(systemName: "arrow.right")
    var imgUp = UIImage(systemName: "arrow.up")
    var imgDown = UIImage(systemName: "arrow.down")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgViewUp.image = imgUp
        imgViewDown.image = imgDown
        imgViewLeft.image = imgLeft
        imgViewRight.image = imgRight
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp
            imgViewDown.image = imgDown
            imgViewLeft.image = imgLeft
            imgViewRight.image = imgRight
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.tintColor = UIColor.red
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.tintColor = UIColor.red
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.tintColor = UIColor.red
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.tintColor = UIColor.red
            default:
                break
            
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp
            imgViewDown.image = imgDown
            imgViewLeft.image = imgLeft
            imgViewRight.image = imgRight
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.tintColor = UIColor.green
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.tintColor = UIColor.green
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.tintColor = UIColor.green
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.tintColor = UIColor.green
            default:
                break
            
            }
        }
    }


}

