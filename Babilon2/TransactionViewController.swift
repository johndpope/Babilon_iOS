//
//  TransactionViewController.swift
//  Babilon2
//
//  Created by yuya on 2017/11/20.
//  Copyright © 2017年 yuya. All rights reserved.
//

import UIKit
import Geth
import KeychainAccess

class TransactionViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func Send(_ sender: UIButton) {
        var error: NSError?

        let keychain = Keychain()
        let address = try! keychain.get("Babilon_address")
        
        let node = try! Node(networkID: .rinkeby)
        try! node.start()
        
        let gethaddress = GethNewAddressFromHex(address, &error)
        
//        Transaction.init(1, gethaddress, GethBigInt(5), GethBigInt(1), GethBigInt(1), nil)
        
        
        let tx = GethNewTransaction(1, gethaddress, GethBigInt(5), GethBigInt(1), GethBigInt(1), nil)
        let gethnode = node._gethNode
        let gethec = try! gethnode.getEthereumClient()
        
        try! gethec.sendTransaction(GethNewContext(), tx: tx)
    }
    
    
}
