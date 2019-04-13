//
//  Cadastro.swift
//  RumoStore
//
//  Created by  Snow on 02/04/2019.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit
import Alamofire


class Cadastro: UIViewController {
    
    // Textfields
    @IBOutlet weak var nome: TextFieldDesign!
    @IBOutlet weak var email: TextFieldDesign!
    @IBOutlet weak var senha: TextFieldDesign!
    @IBOutlet weak var repetirSenha: TextFieldDesign!

    @IBOutlet weak var scrollview: UIScrollView!
    
    let url = "https://console.proitappsolutions.com/v1/app"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func registrarButton(_ sender: Any) {
        cadastrar()
    }
    
    
    
    
    

    
    
    func cadastrar() {
        
        let param = ["nomeCliente" : nome.text!,"email" :  email.text!, "password" : senha.text!] as [String : Any]
       
        Alamofire.request(url, method: .post, parameters: param).responseJSON {
            response in
            
            if response.result.isSuccess {
                print("POST OK")
                
            }else {
                print("Error")
            }
            
        }


  }
    
    
    
    
    
    

}

extension Cadastro: UITextFieldDelegate {
    
    
    //FUNCOES TEXTFIELDS
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollview.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 0
        {
            nome.becomeFirstResponder()
        }
        else if textField.tag == 1 {
            email.becomeFirstResponder()
        }
        else if textField.tag == 2 {
            senha.becomeFirstResponder()
            
        }
        else if textField.tag == 3 {
            repetirSenha.becomeFirstResponder()
            
        }
        textField.resignFirstResponder()
        return true
        
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollview.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
        
    }
    
    
    
    
    
    
    
}
