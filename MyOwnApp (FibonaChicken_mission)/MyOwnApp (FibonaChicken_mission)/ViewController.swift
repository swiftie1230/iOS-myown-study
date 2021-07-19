//
//  ViewController.swift
//  MyOwnApp (FibonaChicken_mission)
//
//  Created by 황서진 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var button1Finshed: Bool!
    var button2Finshed: Bool!
    var button3Finshed: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button1.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button1Finshed = false
        button2.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button2Finshed = false
        button3.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button3Finshed = false
    }


    @IBAction func button1Clicked(_ sender: Any) {
        if button1Finshed == false {
            button1.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            button1Finshed = true
        } else {
            button1.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            button1Finshed = false
        }
    }
    @IBAction func button2Clicked(_ sender: Any) {
        if button2Finshed == false {
            button2.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            button2Finshed = true
        } else {
            button2.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            button2Finshed = false
        }
    }
    @IBAction func button3Clicked(_ sender: Any) {
        if button3Finshed == false {
            button3.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            button3Finshed = true
        } else {
            button3.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            button3Finshed = false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if var controller = segue.destination as? FinalViewController {
            var answer = 0
            
            if button1Finshed == true {
                answer += 1
            }
            if button2Finshed == true {
                answer += 1
            }
            if button3Finshed == true {
                answer += 1
            }
           controller.numberOfTaskAccomplished = answer
            
        }
       
    }
}

