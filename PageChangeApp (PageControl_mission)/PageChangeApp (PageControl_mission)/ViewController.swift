//
//  ViewController.swift
//  PageChangeApp (PageControl_mission)
//
//  Created by 황서진 on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        numberLabel.text = "1"
    }

    @IBAction func pageChange(_ sender: Any) {
        numberLabel.text = String(pageControl.currentPage + 1)
    }
    
}

