//
//  ViewController.swift
//  macOSwebview
//
//  Created by rohshar6 on 29/04/22.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    var webView: WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: """
https://google.com
""")!
        let req = URLRequest(url: url)
        let configuration = WKWebViewConfiguration()
        configuration.processPool = WKProcessPool()
        configuration.websiteDataStore = WKWebsiteDataStore.default()
        configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        webView = WKWebView(frame: .zero, configuration: configuration)
        
        webView?.load(req)
        view = webView!
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

