//
//  ViewController.swift
//  Alert
//
//  Created by 황서진 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(systemName: "lightbulb.fill")
    let imgOff = UIImage(systemName: "lightbulb")
    let imgRemove = UIImage(systemName: "lightbulb.slash")
    
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn == true) {
            // UIAlertController를 생성한다.
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 ON 상태입니다", preferredStyle: UIAlertController.Style.alert)
            
            // UIAlertAction을 생성한다. -> 특별한 동작을 하지 않을 경우 handler는 nil!
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            
            // 생성된 onAction을 얼럿에 추가한다.
            lampOnAlert.addAction(onAction)
            
            // present 메서드를 실행한다.
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImg.image = imgOn
            isLampOn = true
        }
        
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            // UIAlertController를 생성한다.
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            // UIAlertAction을 생성한다. -> 특별한 동작을 하지 않을 경우 handler는 nil!
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            // 생성된 onAction을 얼럿에 추가한다.
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            // present 메서드를 실행한다.
            present(lampOffAlert, animated: true, completion: nil)
            
            
        } else {
            let alreadylampOffAlert = UIAlertController(title: "경고", message: "현재 OFF 상태입니다", preferredStyle: UIAlertController.Style.alert)
            
            // UIAlertAction을 생성한다. -> 특별한 동작을 하지 않을 경우 handler는 nil!
            let alreadyoffAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            
            // 생성된 onAction을 얼럿에 추가한다.
            alreadylampOffAlert.addAction(alreadyoffAction)
            
            // present 메서드를 실행한다.
            present(alreadylampOffAlert, animated: true, completion: nil)
            
            
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let OnAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(OnAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

