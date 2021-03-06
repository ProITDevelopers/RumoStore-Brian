//
//  VanguardaWeb.swift
//  RumoStore
//
//  Created by  Snow on 11/04/2019.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit
import WebKit

class VanguardaWeb: UIViewController {

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
        
        
        let url = URL(string: "https://www.vanguarda.co.ao/")
        let request = URLRequest(url: url!)
        webview.load(request)
        webview.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    }
    
    
    
    
    @IBAction func sairButton(_ sender: Any) {
        let loginPage =  self.storyboard?.instantiateViewController(withIdentifier: "login") as! ViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = loginPage

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
