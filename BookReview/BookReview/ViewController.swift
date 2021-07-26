//
//  ViewController.swift
//  BookReview
//
//  Created by 황서진 on 2021/07/26.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var parameters = [
            "title_give": "너무나도 쉬운 iOS 개발",
            "author_give": "황서진",
            "review_give": "재밌어요!"
        ]

        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
            var json = JSON(response.value!)
            print(json)
        }
    }


}

