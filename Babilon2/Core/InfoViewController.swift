//
//  InfoViewController.swift
//  Babilon2
//
//  Created by yuya on 2017/11/18.
//  Copyright © 2017年 yuya. All rights reserved.
//

import UIKit
import KeychainAccess
import Geth



class InfoViewController: UIViewController {

    
    @IBOutlet weak var AddressLabel: UILabel!
    
    @IBOutlet weak var BalanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keychain = Keychain()
        let address = try! keychain.get("Babilon_address")
        AddressLabel.text = address
        
        
        
       
        
        
        
        
        
        
        // MARK: - Synchronization privates
                
//                var error: NSError?
//                let bootNodes = GethNewEnodesEmpty()
//                let rawurl = GethFoundationBootnodes()
//                bootNodes?.append(GethNewEnode("\(rawurl)", &error))
//
////                let genesisPath = Bundle.main.path(forResource: "rinkeby", ofType: "json")
////                let genesis = try! String(contentsOfFile: genesisPath!, encoding: String.Encoding.utf8)
//                let genesis = GethMainnetGenesis();
//
//                let config = GethNewNodeConfig()
//                config?.setBootstrapNodes(bootNodes)
//                config?.setEthereumGenesis(genesis)
//                config?.setEthereumNetworkID(1)
//                config?.setEthereumNetStats("flypaper:Respect my authoritah!@stats.rinkeby.io")
//
//                let datadir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//                let ethereumNode = GethNewNode(datadir + "/.rinkeby", config, &error)
//
//                try! ethereumNode!.start()
//                let ethereumClient = try! ethereumNode!.getEthereumClient()
        
//                if let error = error {
//                    throw EthereumError.nodeStartFailed(error: error)
//                }
        
        do {
            var error: NSError?

            let node = try Node(networkID: .main)
            try node.start()
            let client = try node.ethereumClient()
            let gethaddress = GethNewAddressFromHex(address, &error)

            let address = try Address(hex: address!)
            let balance = try client.balance(for: address)
            print("Balance: \(balance) WEI")
            BalanceLabel.text = "\(balance) WEI"
            
            
            
            let tx = GethNewTransaction(1, gethaddress, GethBigInt(5), GethBigInt(1), GethBigInt(1), nil)
            let gethnode = node._gethNode
            let gethec = try! gethnode.getEthereumClient()
            
            try! gethec.sendTransaction(GethNewContext(), tx: tx)
            
            
        } catch {
            // Handle error
        }
        
//        var error: NSError?
//        let ctx = GethNewContext()
//        let datadir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let ethereumNode = GethNewNode(datadir + "/.ethereum", GethNewNodeConfig(), &error)
//
//        try! ethereumNode!.start()
//        let ec = try! ethereumNode?.getEthereumClient()
        
        
//        let nodeinfo = ethereumNode?.getInfo()
//        let protocols = nodeinfo?.getProtocols()
//        let block_number = try! ec?.getBlockByNumber(ctx, number: -1).getNumber()
        
        
        
//        let gethaddress = GethNewAddressFromHex(address, &error)
        
        
//         let balance = try! ec!.getBalanceAt(ctx, account: gethaddress!, number: -1).getInt64()
//        AddressLabel.text = "\(block_number!)"
        AddressLabel.text = address

//        BalanceLabel.text = "\(balance) ETH"
        
            
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

}


