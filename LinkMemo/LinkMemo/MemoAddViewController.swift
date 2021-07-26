//
//  MemoAddViewController.swift
//  LinkMemo
//
//  Created by 황서진 on 2021/07/26.
//

import UIKit
import Alamofire
import SwiftyJSON

class MemoAddViewController: UIViewController {

    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var commentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        urlTextField.layer.cornerRadius = 10
        urlTextField.layer.borderWidth = 1
        urlTextField.layer.borderColor = UIColor.gray.cgColor
        // left에 여백을 20 넣겠다.
        urlTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        urlTextField.leftViewMode = .always
        
        commentTextField.layer.cornerRadius = 10
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.borderColor = UIColor.gray.cgColor
        // left에 여백을 20 넣겠다.
        commentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        commentTextField.leftViewMode = .always
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        var url = urlTextField.text ?? ""
        var comment = commentTextField.text ?? ""
        
        // 얼럿 표시
        if url.count == 0 || comment.count == 0 {
            var alert = UIAlertController(title: "경고", message: "모두의 링크 메모장을 모두 입력해 주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var parameters = [
            "url_give": url,
            "comment_give": comment,
        ]
        
        AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameters).responseJSON { (response) in
            if var value = response.value {
                var json = JSON(value)
                print(json)
                            
                //입력 화면을 사라지게 하고, 테이블뷰로 돌아가기
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
