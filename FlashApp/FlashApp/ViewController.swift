//
//  ViewController.swift
//  FlashApp
//
//  Created by 황서진 on 2021/07/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var Image: UIImageView!
    @IBOutlet var titleKor: UILabel!
    @IBOutlet var titleEng: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonClicked(_ sender: Any) {
        view.backgroundColor = UIColor(red: 225 / 255.0, green: 252 / 255.0, blue: 187 / 255.0, alpha: 1)
        label.textColor = UIColor.black
        titleKor.textColor = UIColor.black
        titleKor.text = "손전등을 끄고 싶으신가요?"
        titleEng.text = "Wanna turn off your flashlight?"
        Image.image = UIImage(systemName: "flashlight.on.fill")
    }
    @IBAction func offButtonClicked(_ sender: Any) {
        view.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        titleKor.textColor = UIColor.white
        titleKor.text = "손전등을 키고 싶으신가요?"
        titleEng.text = "Wanna light your flashlight?"
        Image.image = UIImage(systemName: "flashlight.off.fill")
    }
}
