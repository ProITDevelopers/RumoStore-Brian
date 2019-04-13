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
    

    @IBOutlet weak var nome: TextFieldDesign!
    @IBOutlet weak var email: TextFieldDesign!
    @IBOutlet weak var senha: TextFieldDesign!
    @IBOutlet weak var repetirSenha: TextFieldDesign!
    @IBOutlet weak var carregar: UIActivityIndicatorView!
    @IBOutlet weak var scrollview: UIScrollView!
    
    let url = "https://console.proitappsolutions.com/v1/app"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func registrarButton(_ sender: Any) {
        cadastrar()
    }
    
    
    
    
    

    
    
    func cadastrar() {
        self.carregar.startAnimating()
        self.carregar.isHidden = false
        let param = ["nomeCliente" : nome.text!,"email" :  email.text!, "password" : senha.text!] as [String : String]
       
        Alamofire.request(url, method: .post, parameters: param).responseString {
            response in
            
            if response.result.isSuccess {
                print("POST OK")
                self.carregar.stopAnimating()
                self.mostrarMensagem(mensagem: "Cadastro Efetuado com Sucesso")
                let loginPage =  self.storyboard?.instantiateViewController(withIdentifier: "login") as! ViewController
                let appDelegate = UIApplication.shared.delegate
                appDelegate?.window??.rootViewController = loginPage
                
                
            }else {
                self.carregar.stopAnimating()
                self.mostrarMensagem(mensagem: "Alguma coisa correu mal, verifique os campos ou tente novamente mais tarde!")
                print("Error")
            }
            
        }


  }
    
    
    
    func mostrarMensagem(mensagem: String) {
        let mensagem  = UIAlertController(title: "AVISO", message: mensagem, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (actions) in
            mensagem.dismiss(animated: true, completion: nil)
        }
        mensagem.addAction(action)
        self.present(mensagem,animated: true, completion: nil)
        
    }
    
    
    
    
    

}

extension Cadastro: UITextFieldDelegate {
    
    
    //FUNCOES TEXTFIELDS
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollview.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 0
        {
            email.becomeFirstResponder()
        }
        else if textField.tag == 1 {
            senha.becomeFirstResponder()
        }
        else if textField.tag == 2 {
            repetirSenha.becomeFirstResponder()
            
        }
        textField.resignFirstResponder()
        return true
        
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollview.setContentOffset(CGPoint(x: 0, y: 0), animated: true)    
    }
    
    
    
    
    
    
    
}
