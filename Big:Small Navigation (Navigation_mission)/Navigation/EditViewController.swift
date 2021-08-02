//
//  EditViewController.swift
//  Navigation
//
//  Created by 황서진 on 2021/08/02.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didimageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didimageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = true

    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var btnIsZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        if isZoom == true {
            btnIsZoom.setTitle("축소", for: .normal)
        } else {
            btnIsZoom.setTitle("확대", for: .normal)
        }
        
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didimageOnOffDone(self, isOn: isOn)
            delegate?.didimageZoomDone(self, isZoom: isZoom)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnBiggerSmaller(_ sender: UIButton) {
        
        if isZoom == true {
            isZoom = false
            btnIsZoom.setTitle("확대", for: .normal)
            print("false")
        } else {
            isZoom = true
            btnIsZoom.setTitle("축소", for: .normal)
            print("true")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
