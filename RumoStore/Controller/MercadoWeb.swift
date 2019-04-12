//
//  MercadoWeb.swift
//  RumoStore
//
//  Created by  Snow on 11/04/2019.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit
import WebKit

class MercadoWeb: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var carregar: UIActivityIndicatorView!
    @IBOutlet weak var menuBotao: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBotao.target = self.revealViewController()
        menuBotao.action = #selector(SWRevealViewController.revealToggle(_:))
    self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
    self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
    self.revealViewController()?.rearViewRevealWidth = 305
        
        

        let request = URLRequest(url: URL(string: "https://www.mercado.co.ao/")!)
        self.webview.load(request)
        self.webview.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    }
    
  
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "loading" {
            
            if webview.isLoading {
                carregar.startAnimating()
                carregar.isHidden = false
                
            }else {
                carregar.stopAnimating()
                
            }
        }
    }
    


}
