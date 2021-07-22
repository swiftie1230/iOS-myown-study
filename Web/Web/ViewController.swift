//
//  ViewController.swift
//  Web
//
//  Created by 황서진 on 2021/07/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var ActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage (_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://swiftie1230.github.io")
    }
    
    // 로딩 중인지를 확인하기 위한 webView 함수
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // myWebView가 로딩중일 때 인디케이터를 실행하고 화면에 나타나게 한다.
        ActivityIndicator.startAnimating()
        ActivityIndicator.isHidden = false
    }
    
    // 로딩이 완료되었을 때 동작 : 인디케이터를 중지하고 숨긴다.
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ActivityIndicator.stopAnimating()
        ActivityIndicator.isHidden = true
    }
    
    // 로딩에 실패했을 때 동작 : 인디케이터를 중지하고 숨긴다.
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ActivityIndicator.stopAnimating()
        ActivityIndicator.isHidden = true
    }
    
    // 프로토콜이 있는지를 검사하고, 없을 경우 "http://" 문자열을 자동으로 추가하는 함수
    func checkURL(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        
        return strUrl
        
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkURL(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
        
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://github.com/swiftie1230")
    }
    
    @IBAction func btnGoSite2(_ sender: Any) {
        loadWebPage("https://www.instagram.com/after._.glow__/")
    }
    
    // HTML 버튼을 클릭하면 변수의 내용이 HTML 형식에 맞추어 웹 뷰로 나타나게 구현하는 함수
    // HTML로 표현할 수 있는 모든 것은 웹 뷰를 통해 표현할 수 있다.
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"https://swiftie1230.github.io\">my_Own_DevBlog</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // 간단하게 파일을 프로젝트에 추가하고 HTML 문법에 맞게 작성한 후, File 버튼을 클릭하면 이 파일이 웹 뷰에 나타나도록 구현한 함수
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myURL = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myURL)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        // 웹 페이지의 로딩을 중지시키는 함수를 호출한다.
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        // 웹 페이지를 재로딩시키는 함수를 호출한다.
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        // 이전 웹 페이지로 이동시키는 함수를 호출한다.
        myWebView.goBack()
    }
    
    @IBAction func btnGoFoward(_ sender: Any) {
        // 다음 웹페이지로 이동시키는 함수를 호출한다.
        myWebView.goForward()
    }
}

