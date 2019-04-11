//
//  PaginaInicial.swift
//  RumoStore
//
//  Created by  Snow on 03/04/2019.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class PaginaInicial: UIViewController, XMLParserDelegate {

    @IBOutlet weak var menuBotao: UIBarButtonItem!
    @IBOutlet weak var colletionview: UICollectionView!
    

    
    //MARK: DECLARACAO VARIAVEIS

    var noticias: NSArray = []
    var fotos: [AnyObject] = []
    var url: URL!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBotao.target = self.revealViewController()
        menuBotao.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        self.revealViewController()?.rearViewRevealWidth = 305
        
        carregarDados()
    }
    
    
    func carregarDados() {
        url = URL(string: "https://mercado.co.ao/rss/newsletter.xml")!
        carregarRss(url);
    }
    
    
    func carregarRss(_ data: URL) {
        
        // XmlParserManager declaracap
        let pegarDados : XmlParserManager = XmlParserManager().initWithURL(data) as! XmlParserManager
        
        // poes os dados no array
        fotos = pegarDados.img as [AnyObject]
        noticias = pegarDados.feeds
        colletionview.reloadData()
    }
    
  

}






//MARK: Extensions

extension PaginaInicial: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticias.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noticias", for: indexPath) as! PaginaInicialCell

//
//        // carrega as imagens
//        let url = NSURL(string:fotos[indexPath.row] as! String)
//        let data = NSData(contentsOf:url! as URL)
//        let image = UIImage(data:data! as Data)
//
//        cell.fotoRumo.image = image
        cell.textoRumo.text = (noticias.object(at: indexPath.row) as AnyObject).object(forKey: "title") as? String
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "feed") as? FeedWeb
        
        let selectedFURL: String = (noticias[indexPath.row] as AnyObject).object(forKey: "link") as! String
        vc?.selectedFeedURL = selectedFURL as String
        
        self.navigationController?.pushViewController(vc!, animated: true)
  
    }
    
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 85)
    }
    
    

    
    
    
}


