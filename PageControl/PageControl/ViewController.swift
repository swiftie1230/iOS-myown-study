//
//  ViewController.swift
//  PageControl
//
//  Created by 황서진 on 2021/07/29.
//

import UIKit

// 화면에 보여줄 이미지 파일의 이름을 저장한 배열
var images = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg"]

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: Any) {
        // 페이지가 변경되었을 때 현재 페이지에 해당하는 이미지 파일의 이름을 images 배열에서 가지고 와서 imgView에 할당하여 화면에 이미지를 출력한다.
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

