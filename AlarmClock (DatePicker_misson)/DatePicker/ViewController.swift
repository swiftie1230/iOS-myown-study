//
//  ViewController.swift
//  DatePicker
//
//  Created by 황서진 on 2021/07/13.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime: String?

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        // 데이터 피커를 선택할 때, 발생하는 액션 함수인 'changeDatePicker'가 호출되면서 sender라는 UIDatePicker 자료형의 인수가 전달된다. 이 sender를 datePickerView라는 상수에 저장한다.
        let datePickerView = sender
        
        // 날짜를 출력하기 위하여 DateFormatter라는 클래스 상수 formatter를 선언한다.
        let formatter = DateFormatter()
        
        // formatter의 dateFormat 속성을 설정한다. 포맷은 "년-월-일 시:분:초-요일"로 설정한다.
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        alarmTime = formatter.string(from: datePickerView.date)
        
        // 선택 날짜와 시간을 string메서드를 이용하여 문자열로 변환한다.
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count += 1
        
        // 현재 시간을 NSDate 함수를 사용하여 가져온다.
        let date = NSDate()
        
        // 날짜를 출력하기 위하여 DateFormatter라는 클래스의 상수 formatter를 선언
        let formatter = DateFormatter()
        
        // DateFormatter의 속성 결정
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        let currentTime = formatter.string(from: date as Date)
        if (alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        
    }
    
}

