//
//  ViewController.swift
//  Map
//
//  Created by 황서진 on 2021/07/27.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
        // 상수 locationManager의 델리게이트를 self로 설정한다.
        locationManager.delegate = self
        
        // 정확도를 최고로 설정한다.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 위치 데이터를 추적하기 위해 사용자에게 승인을 요구한다.
        locationManager.requestWhenInUseAuthorization()
        
        // 위치 업데이트 시작!
        locationManager.stopUpdatingLocation()
        
        // 위치 보기 값을 true로 설정한다. -> 즉, 위치를 보여준다는 뜻!
        myMap.showsUserLocation = true
    }
    
    // 입력 파라미터는 위도 값, 경도 값, 범위
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        
        // 위도 값과 경도 값을 매개변수로 하여 CLLocationCoordinate2DMake 함수를 호출하고, 리턴 값을 pLocation으로 받는다.
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        
        // 범위 값을 매개변수로 하여 MKCoordinateSpanMake 함수를 호출하고, 리턴 값을 spanValue로 받는다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        
        // pLocation과 spanValue 값을 매개변수로 하여 MKCoordinateRegionMake 함수를 호출하고, 리턴 값을 pRegion으로 받는다.
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        // pRegion 값을 매개변수로 하여 myMap.setRegion 함수를 호출한다.
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
        
    }
    
    func setAnnotation(latitiudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitiudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    // 위치가 업데이트 되었을 때 지도에 위치를 나타냄.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 위치가 업데이트되면 먼저 마지막 위치 값을 찾아낸다.
        let pLocation = locations.last
        
        // 마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출한다.
        // 이때 delta 값은 지도의 크기를 의미. 값이 작을 수록 확대 되는 효과! 0.01 -> 100배 확대
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            
            // placemarks 값의 첫 부분만 pm 상수로 받는다.
            let pm = placemarks!.first
            
            // 이 pm 상수에서 나라(country)값을 추출하고, 나머지도 존재하면 출력
            let country = pm!.country
            var address:String = country!
            
            // 지역 존재하면 address에 추가
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            // 도로 존재하면 address에 추가
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitiudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국 폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitiudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        } else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latitiudeValue: 36.598422, longitudeValue: 127.470235, delta: 0.1, title: "우리집", subtitle: "충청북도 청원군 남이면 가마리 50")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리집"
        }
    }
}

