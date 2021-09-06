//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 황서진 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var imgView: UIImageView!
    
    var images = [UIImage]()
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1 ..< 10 {
            images.append(UIImage(named: "\(i).jpg")!)
        }
        images.append(UIImage(named: "10.jpeg")!)
        
        imgView.image = images[0]
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgView.image = images[self.num]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                self.num -= 1
                if self.num == -1 {
                    self.num = 9
                }
                imgView.image = images[self.num]
            case UISwipeGestureRecognizer.Direction.left:
                
                self.num += 1
                if self.num == 10 {
                    self.num = 0
                }
                imgView.image = images[self.num]
            default:
                break
            
            }
        }
    }

}

