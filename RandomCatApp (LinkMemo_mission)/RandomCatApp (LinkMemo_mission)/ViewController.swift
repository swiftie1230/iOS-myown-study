//
//  ViewController.swift
//  RandomCatApp (LinkMemo_mission)
//
//  Created by 황서진 on 2021/07/26.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshCat()
    }

    @IBAction func refreshBtnClicked(_ sender: UIButton) {
        refreshCat()
    }
    
    func refreshCat() {
        AF.request("https://api.thecatapi.com/v1/images/search").responseJSON { (response) in
            if var value = response.value {
                var json = JSON(value)
                // 그냥 서버 자체에서 랜덤하게 정해줌. 우리는 그냥 0번째 값을 받아와서 넣어주기만 하면 됨.
                var cat = json.arrayValue[0]
                var catImageUrl = cat["url"].stringValue
                self.imageView.sd_setImage(with: URL(string: catImageUrl)!, completed: nil)
            }
        }
    }
}

