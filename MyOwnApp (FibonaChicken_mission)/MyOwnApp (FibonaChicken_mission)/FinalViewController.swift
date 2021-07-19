//
//  FinalViewController.swift
//  MyOwnApp (FibonaChicken_mission)
//
//  Created by 황서진 on 2021/07/19.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet var congratsLabel: UILabel!
    @IBOutlet var accomplishLabel: UILabel!
    var numberOfTaskAccomplished: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        if numberOfTaskAccomplished == 3 {
            congratsLabel.text = "축하해요! 모두 달성하셨네요!"
        } else {
            congratsLabel.text = "앗! 아쉽게도 모두 달성은 실패!"
        }
        accomplishLabel.text = "당신의 달성률은\n \(calculateTask())%입니다"
    }
    

    func calculateTask() -> Int {
        return Int((Double(numberOfTaskAccomplished) / Double(3)) * 100)
    }

}
