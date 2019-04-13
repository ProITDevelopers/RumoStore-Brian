//
//  Quiosque.swift
//  RumoStore
//
//  Created by  Snow on 13/04/2019.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class Quiosque: UIViewController {
    
    
    @IBOutlet weak var icarousel: iCarousel!
    @IBOutlet weak var icarouselView: iCarousel!
    @IBOutlet weak var icarouselview: iCarousel!
    @IBOutlet weak var menuBotao: UIBarButtonItem!
    
    
    let array = [ UIImage(named: "foto-1") ,UIImage(named: "foto-2"),UIImage(named: "foto-3"),UIImage(named: "foto-4") ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBotao.target = self.revealViewController()
        menuBotao.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        self.revealViewController()?.rearViewRevealWidth = 305
        
        
        
        icarouselview.type = .coverFlow
        icarouselview.contentMode = .scaleAspectFill
        icarouselview.isPagingEnabled = true
        icarouselview.scrollToItem(at: array.count / 2, animated: true)
        icarousel.type = .coverFlow
        icarousel.contentMode = .scaleAspectFill
        icarousel.isPagingEnabled = true
            icarousel.scrollToItem(at: array.count / 2, animated: true)
        icarouselView.type = .coverFlow
        icarouselView.contentMode = .scaleAspectFill
        icarouselView.isPagingEnabled = true
        icarouselView.scrollToItem(at: array.count / 2, animated: true)
        
    }
    


    @IBAction func sairButton(_ sender: Any) {
        let loginPage =  self.storyboard?.instantiateViewController(withIdentifier: "login") as! ViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = loginPage
    }
    
    
}

extension Quiosque: iCarouselDelegate, iCarouselDataSource {

    func numberOfItems(in carousel: iCarousel) -> Int {
        return array.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imagens: UIImageView!
        
        if view == nil {
            imagens = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
            imagens.contentMode = .scaleAspectFit
        }else {
            imagens = view as? UIImageView
        }
        
    imagens.image = array[index]
    return imagens
        
    }
    
   

}
