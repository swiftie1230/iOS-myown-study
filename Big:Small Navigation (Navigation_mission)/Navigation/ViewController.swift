//
//  ViewController.swift
//  Navigation
//
//  Created by 황서진 on 2021/08/02.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(systemName: "lightbulb")
    let imgOff = UIImage(systemName: "lightbulb.slash")
    
    var isOn = true
    var isZoom = false
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
             
        } else if segue.identifier == "editBarButton" {
            // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar Button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didimageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didimageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        
        print(imgView.frame.width, imgView.frame.height)
        
        let scale: CGFloat = 2.0
        
        var newWidth:CGFloat = imgView.frame.width, newHeight:CGFloat = imgView.frame.height
        
        if isZoom {
            if self.isZoom != true {
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                print("*", newWidth, newHeight)
                self.isZoom = true
            }
        } else {
            if self.isZoom != false {
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                print("/", newWidth, newHeight)
                self.isZoom = false
            }
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        
    }
    

}

