//
//  ViewController.swift
//  DrawFlowerGraphic (DrawGraphics_mission)
//
//  Created by 황서진 on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Circles
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.systemPink.cgColor)
        
        context.addEllipse(in: CGRect(x: 120, y: 150, width: 100, height: 100))
        
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.systemPink.cgColor)
        
        context.addEllipse(in: CGRect(x: 170, y: 150, width: 100, height: 100))
        
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.systemPink.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 150, width: 100, height: 100))
        
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.systemPink.cgColor)
        
        context.addEllipse(in: CGRect(x: 120, y: 100, width: 100, height: 100))
        
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.systemPink.cgColor)
        
        context.addEllipse(in: CGRect(x: 120, y: 200, width: 100, height: 100))
        
        context.strokePath()
        
        // Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.fillPath()
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

    }
    
    
}

