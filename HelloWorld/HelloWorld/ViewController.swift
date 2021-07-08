//
//  ViewController.swift
//  HelloWorld
//
//  Created by 황서진 on 2021/07/04.
//

import UIKit

class ViewController: UIViewController {
    // 확대 여부를 나타내는 변수 isZoom
    var isZoom = false
    // 켜진 전구 이미지가 있는 UIImage 타입의 변수 imgOn
    var imgOn : UIImage?
    // 꺼진 전구 이미지가 있는 UIImage 타입의 변수 imgOff
    var imgOff : UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(systemName: "lightbulb")
        imgOff = UIImage(systemName: "lightbulb.slash")
        
        imgView.image = imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        // 확대 버튼을 클릭할 경우 이미지를 두 배로 확대할 것이므로 확대할 스케일 값을 보관할 scale 상수를 CGFloat(실수형) 타입으로 선언하고 값을 '2.0'으로 설정한다.
        let scale: CGFloat = 2.0
        // 확대할 크기를 계산해서 보관할 변수 newWidth와 newHeight를 CGFloat 타입으로 선언한다.
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom) { //true
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        } else { // false
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
            view.backgroundColor = UIColor.white
        } else {
            imgView.image = imgOff
            view.backgroundColor = UIColor.black
        }
    }
}

