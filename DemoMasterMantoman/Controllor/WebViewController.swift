//
//  WebViewController.swift
//  DemoMasterMantoman
//
//  Created by Anh vũ on 5/23/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var listJob: Job?
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let listJob = listJob?.showWeb else {return}
            if let url = URL(string: listJob) {
                let urlRequest = URLRequest(url: url)
                webView.loadRequest(urlRequest)
            }
            
        
       
    }
   
}
