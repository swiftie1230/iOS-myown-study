//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by 황서진 on 2021/08/04.
//

import UIKit
import Firebase
import FirebaseAnalytics
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport



class FingerGameViewController: UIViewController {

    @IBOutlet var gameView: FingerGameView!
    @IBOutlet var secondsLabel: UILabel!
    
    
    var secondsLeft = 5
    var interstitial: GADInterstitialAdBeta? // 광고 변수 추가
    var didOpenAd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameView.controller = self
        requestIDFA()
    }
    
    //광고준비하기
        func requestIDFA() {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                let request = GADRequest()
                GADInterstitialAdBeta.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                                           request: request) { (ad, error) in
                    if error != nil {
                        return
                    }
                    
                    self.interstitial = ad
                }
            })
        }
    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        // 이전 화면으로 돌아간다.
        self.dismiss(animated: true, completion: nil)
    }
    
    var timer: Timer?
    
    func touchCountDidChanage() {
        timer?.invalidate()
        

        Analytics.logEvent("Game_Start", parameters: nil)
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
                let roundViews = [UIView](self.gameView.touchToRoundView.values)
                
                // 터치 개수가 0이면 딱히 반응 안하기
                if roundViews.count == 0 {
                    return
                }
                
                //0부터 터치 개수 사이에 랜덤 값 고르기
                let randomChoice = Int.random(in: 0..<roundViews.count)
                
                for i in 0..<roundViews.count {
                    let roundView = roundViews[i]
                    
                    UIView.animate(withDuration: 1) {
                        //랜덤 값이면 반응하기
                        if i == randomChoice {
                            roundView.backgroundColor = UIColor.green
                        } else {
                            // 아니면 오렌지
                            roundView.backgroundColor = UIColor.orange
                        }
                        
                        let center = roundView.center
                        roundView.frame.size = CGSize(width: 120, height: 120)
                        roundView.layer.cornerRadius = 60
                        roundView.center = center
                    }
                }
                
            Analytics.logEvent("Game_End", parameters: ["touchCount": self.gameView.touchToRoundView.count])
            if self.didOpenAd == false {
                self.interstitial?.present(fromRootViewController: self)
                self.didOpenAd = true
            }
        }
        
        resetSecondsTimer()
    }
    
    var secondsTimer: Timer?
    
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.count > 0 {
            
            self.secondsLeft = 5
            self.secondsLabel.text = "5"
            self.blinkSecondsLabel()
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                self.secondsLeft -= 1
                self.secondsLabel.text = "\(self.secondsLeft)"
                self.blinkSecondsLabel()
                
                if self.secondsLeft == 0 {
                    self.secondsLabel.text = ""
                    self.blinkSecondsLabel()
                    self.secondsTimer?.invalidate()
                }
            })
            
        } else {
            self.secondsLabel.text = ""
            self.blinkSecondsLabel()
        }
        
        
    }
    
    func blinkSecondsLabel() {
        self.secondsLabel.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.secondsLabel.alpha = 0
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
