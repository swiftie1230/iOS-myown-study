//
//  ChickenInputViewController.swift
//  FibonaChicken
//
//  Created by 황서진 on 2021/07/19.
//

import UIKit

class ChickenInputViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultButton.layer.cornerRadius = 10
        //resultButton.clipsToBounds = true
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        var text = textField.text ?? "1"
        stepper.value = Double(text) ?? 1
    }
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        textField.text = String(Int(stepper.value))
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     if var controller = segue.destination as? ChickenOutputViewController {
        controller.numberOfPeople = Int(stepper.value)
         
     }
    
 }

}
