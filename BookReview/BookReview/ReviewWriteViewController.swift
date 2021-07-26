//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by 황서진 on 2021/07/26.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReviewWriteViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var reviewTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneBtnClicked(_ sender: UIBarButtonItem) {
        var title = titleTextField.text ?? ""
        var author = authorTextField.text ?? ""
        var review = reviewTextField.text ?? ""
        
        // 얼럿 표시
        if title.count == 0 || author.count == 0 || review.count == 0 {
            var alert = UIAlertController(title: "경고", message: "책 리뷰를 모두 입력해 주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        var parameter = [
            "title_give": title,
            "author_give": author,
            "review_give": review
        ]
        
        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameter).responseJSON { (response) in
            if var value = response.value {
                print(JSON(value))
                
                // 화면을 사라지게 합니다.
                self.navigationController?.popViewController(animated: true)
            }
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
