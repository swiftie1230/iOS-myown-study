//
//  ViewController.swift
//  SwiftPractice2
//
//  Created by 황서진 on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
//        var i = 0
        
        for i in 0..<textFields.count {
            var textField = textFields[i]
            
            if i%2 == 0 {
                textField.text = "홀수번쨰에만 텍스트가 들어갑니다!"
            }
        }
        
//        for textField in textFields {
//            if i%2 == 0 {
//                textField.text = "홀수번째에만 텍스트가 들어갑니다!"
//            }
//
//            i += 1
//        }
    }
    
}

