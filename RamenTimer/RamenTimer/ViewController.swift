//
//  ViewController.swift
//  RamenTimer
//
//  Created by 황서진 on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var timerButton: UIButton!
    @IBOutlet var segement: UISegmentedControl!
    
    var secondsLeft: Int = 180
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.secondsLeft = 180
        updateTimerLabel()
        timerButton.layer.cornerRadius = 10
    }
    
    func resetSegment() {
        if (segement.selectedSegmentIndex == 0) {
            self.secondsLeft = 180
        } else if (segement.selectedSegmentIndex == 1) {
            self.secondsLeft = 240
        } else {
            self.secondsLeft = 300
        }
    }
    
    func resetTimer() {
        // 현재 돌아가는 타이머를 꺼 주세요!
        timer?.invalidate()
        // 타이머를 지워줍니다.
        timer = nil
        timerButton.setTitle("타이머 시작하기", for: .normal)
        
        resetSegment()
        self.updateTimerLabel()
    }
    
    func updateTimerLabel() {
        var minutes = self.secondsLeft / 60
        var seconds = self.secondsLeft % 60
        
        if self.secondsLeft < 10 {
            self.timerLabel.textColor = UIColor.red
        } else {
            self.timerLabel.textColor = UIColor.black
        }
        
        UIView.transition(with: self.timerLabel, duration: 0.3, options: .transitionFlipFromBottom) {
            if self.secondsLeft > 0 {
                self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            } else {
                self.timerLabel.text = "시간 끝!"
            }
        } completion: { (animated) in
            
        }

        
        
    }

    @IBAction func segementClicked(_ sender: UISegmentedControl) {
        resetTimer()
    }
    @IBAction func timerButtonClicked(_ sender: UIButton) {
        // 돌아가는 중간에 click 했을 경우를 의미한다!
        if timer != nil {
            resetTimer()
            return
        }
        
        // 타이머가 시작할 때
        self.timerButton.setTitle("타이머 종료하기", for: .normal)
        resetSegment()
        self.updateTimerLabel()
        
        // 정상적으로 끝까지 갈 경우를 의미한다!
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            self.secondsLeft -= 1
            self.updateTimerLabel()
            
            if self.secondsLeft == 0 {
                self.resetTimer()
            }
        }
    }
    
}

