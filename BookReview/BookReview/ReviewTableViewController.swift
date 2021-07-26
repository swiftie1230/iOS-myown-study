//
//  ReviewTableViewController.swift
//  BookReview
//
//  Created by 황서진 on 2021/07/26.
//

import UIKit
import SwiftyJSON
import Alamofire

class ReviewTableViewController: UITableViewController {
    
    // SwiftyJSON이라는 라이브러리를 import 해야지만 JSON 사용 가능
    var reviews: [JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
            // 조건문에 변수 선언 가능 -> Optional이 아니면 이 변수를 만들어줘. 그리고 밑 코드를 실행시켜줘!
            if var value = response.value {
                var json = JSON(value)
                self.reviews = json["reviews"].arrayValue // 배열값이라고 친절히 알려주는 기능
                //table view를 새로고침하는 방법
                self.tableView.reloadData()
            }
            
        }
    }

    // MARK: - Table view data source
    // 섹션의 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // row의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)

        // Configure the cell...
        var review = reviews[indexPath.row]
        cell.textLabel?.text = "\(review["author"].stringValue) - \(review["title"].stringValue)"
        cell.detailTextLabel?.text = review["review"].stringValue
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
