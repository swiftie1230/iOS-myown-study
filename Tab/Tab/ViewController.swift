//
//  ViewController.swift
//  Tab
//
//  Created by 황서진 on 2021/07/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnBOveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

