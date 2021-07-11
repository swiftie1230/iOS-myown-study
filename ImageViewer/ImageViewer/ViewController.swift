//
//  ViewController.swift
//  ImageViewer
//
//  Created by 황서진 on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {
    var numImage : Int = 1
    var maxImage : Int = 4

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named:"1.jpg")
    }
    
    func letImageName() -> String {
        if (numImage > maxImage) {
            numImage = 1
        }
        
        if (numImage < 1) {
            numImage = maxImage
        }
        
        let imageName = String(numImage) + ".jpg"
        
        return imageName
    }

    @IBAction func beforeClicked(_ sender: UIButton) {
        numImage -= 1
        
        imageView.image = UIImage(named:"\(letImageName())")
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        numImage += 1

        imageView.image = UIImage(named:"\(letImageName())")
    }
}

