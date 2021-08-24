//
//  ViewController.swift
//  Chapter08-APITest
//
//  Created by 황서진 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func callCurrentTime(_ sender: UIButton) {
        do {
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            
            self.currentTime.text = response
            self.currentTime.sizeToFit()
            
        } catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
}

