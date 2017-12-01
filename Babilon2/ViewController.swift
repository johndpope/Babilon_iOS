//
//  ViewController.swift
//  Babilon2
//
//  Created by yuya on 2017/11/18.
//  Copyright © 2017年 yuya. All rights reserved.
//

import UIKit
import Geth
import KeychainAccess
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {

    var webView = WKWebView()
    
    
    @IBOutlet weak var PassphraseField: UITextField!
    @IBOutlet weak var PassphraseLabel: UILabel!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PassphraseField.delegate = self
        
        
        
        webView = WKWebView()
        view.addSubview(webView)
        
        
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        PassphraseLabel.text = textField.text
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func PassphraseCreate(_ sender: UIButton) {
        
        let datadir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let ks = GethNewKeyStore(datadir + "/keystore", GethLightScryptN, GethLightScryptP);
        
        // Create a new account with the specified encryption passphrase.
//        let newAcc = try! ks?.newAccount("\(PassphraseField.text)")
        let newAcc = try! ks?.newAccount("example")

        
        let address = "\(newAcc!.getAddress().getHex()!)"

        
        
        let keychain = Keychain()
        try! keychain.set("\(address)", key:"Babilon_address")
        
       
        
        PassphraseLabel.text = try! keychain.get("Babilon_address")
        
        
        
        
        
    }
}

