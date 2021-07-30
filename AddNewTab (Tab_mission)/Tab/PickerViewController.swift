//
//  ViewController.swift
//  PickerView
//
//  Created by 황서진 on 2021/07/15.
//

// 피커 뷰가 상호작용하려면 피커 뷰에 대한 델리게이트 메서드를 사용해야 한다.
// 피커 뷰의 델리게이트 사용을 설정하기 위해 마우스 오른쪽 버튼으로 피커 뷰를 선택한 후 위쪽의 뷰 컨트롤러 아이콘 위로 끌어다 놓는다.

import UIKit

// 피커 뷰의 델리게이트 메서드를 사용하려면 UIPickerViewDelegate 클래스와 UIPickerViewDataSource 클래스를 상속받아야 한다.
class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 9
    
    // 피커 뷰에 표시되는 열의 개수 관련 변수! -> component의 수
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg"]
    
    // pickerview에서 Image 선택! -> selected Item에 show -> Image show

    // pickerview에 대한 아울렛 변수
    @IBOutlet var pickerImage: UIPickerView!
    
    // selected Item을 표시해주는 Label에 대한 아울렛 변수
    @IBOutlet var lblImageFileName: UILabel!
    
    // 선택한 이미지를 보여주는 imageView에 대한 아울렛 변수
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MAX_ARRAY_NUM의 개수만큼 imageFileName에 있는 이미지를 가져와 UIImage 타입의 상수 image에 할당하고, 할당된 이미지를 배열 imageArray에 추가한다.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        // 뷰가 로드되었을 때 초기값
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }

//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x:0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    
    // 피커 뷰의 델리게이트 메서드 중 didSelectRow 인수가 포함된 메서드는 사용자가 피커 뷰의 룰렛을 선택했을 때 호출된다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }

}

