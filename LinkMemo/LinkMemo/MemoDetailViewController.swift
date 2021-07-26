//
//  MemoDetailViewController.swift
//  LinkMemo
//
//  Created by 황서진 on 2021/07/26.
//

import UIKit
import SwiftyJSON

class MemoDetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var CommentTextView: UITextView!
    
    var memo: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        contentTextView.text = memo["desc"].stringValue
        CommentTextView.text = memo["comment"].stringValue
        self.title = memo["title"].stringValue
    }
    

    @IBAction func linkBtnClicked(_ sender: UIBarButtonItem) {
        UIApplication.shared.open(URL(string: memo["url"].stringValue)!, options: [:], completionHandler: nil)
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
