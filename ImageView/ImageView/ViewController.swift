//
//  ViewController.swift
//  ImageView
//
//  Created by 황서진 on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {
    // image의 확대 여부를 나타내는 변수
    var isZoom = false
    // 켜진 전구 이미지 (UIImage 타입임을 명시)
    var imgOn : UIImage?
    // 꺼진 전구 이미지 (UIImage 타입임을 명시)
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
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            
            btnResize.setTitle("축소", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        // 스위치가 켜져 있다면, imgView를 켜진 전구로 바꾼다.
        if sender.isOn {
            imgView.image = imgOn
        } else
        // 스위치가 꺼져 있다면, imgView를 꺼진 전구로 바꾼다.
        {
            imgView.image = imgOff
        }
    }
}

