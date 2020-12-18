//
//  ViewController.swift
//  BackGroundMusicApp
//
//  Created by 柿沼儀揚 on 2020/12/18.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    let webView : UIWebView = UIWebView()
     
     // adjust SafeArea top space
     // portrait のみを想定
     var topPadding:CGFloat = 0
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         // Delegate設定
         webView.delegate = self
         
     }
     
     // iPhone X のSafeArea調整のため
     override func viewDidAppear(_ animated: Bool){
         
         let screenWidth:CGFloat = view.frame.size.width
         let screenHeight:CGFloat = view.frame.size.height
         
         // iPhone X , X以外は0となる
         if #available(iOS 11.0, *) {
             let window = UIApplication.shared.keyWindow
             topPadding = window!.safeAreaInsets.top
         }
         
         // Webページの大きさを画面に合わせる
         let rect = CGRect(x: 0,
                           y: topPadding,
                           width: screenWidth,
                           height: screenHeight - topPadding)
         
         webView.frame = rect
         webView.scalesPageToFit = true
         
         // インスタンスをビューに追加する
         self.view.addSubview(webView)
         
         // URLを指定
         let url = URL(string: "https://www.youtube.com/")!
         let request: URLRequest = URLRequest(url: url)
         
         // リクエストを投げる
         webView.loadRequest(request)
  
     }
    
     // ロード時にインジケータをまわす
     func webViewDidStartLoad(_ webView: UIWebView) {
         UIApplication.shared.isNetworkActivityIndicatorVisible = true
         print("indicator on")
     }
     
     // ロード完了でインジケータ非表示
     func webViewDidFinishLoad(_ webView: UIWebView) {
         UIApplication.shared.isNetworkActivityIndicatorVisible = false
         print("indicator off")
     }
}

