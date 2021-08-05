//
//  FingerGameView.swift
//  FingerGame
//
//  Created by 황서진 on 2021/08/04.
//

import UIKit

class FingerGameView: UIView {
    
    weak var controller: FingerGameViewController?
    
    var touchToRoundView : [UITouch: UIView] = [:]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            view.center = touch.location(in: self)
            view.backgroundColor = UIColor(named: "LightYellowish")
            view.layer.cornerRadius = 40
            
            self.touchToRoundView[touch] = view
            self.addSubview(view)
            
            self.controller?.touchCountDidChanage()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            view?.center = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChanage()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChanage()
        }
    }

}
