//
//  ViewController.swift
//  SwiftPractice1
//
//  Created by 황서진 on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var onOffSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        UIView.transition(with: imageView, duration: 0.6, options: .transitionFlipFromLeft) {
            if self.onOffSwitch.isOn {
                self.imageView.image = UIImage(named: "ace")
            } else {
                self.imageView.image = UIImage(named: "poker")
            }
        } completion: {(animated) in

        }
    }
}

