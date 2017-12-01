//
//  BalanceHandler.swift
//  Babilon2
//
//  Created by yuya on 2017/11/26.
//  Copyright © 2017年 yuya. All rights reserved.
//

import Geth

struct BalanceHandler {
    
    let didUpdateBalance: (Int64) -> Void
    let didReceiveTransactions: ([GethTransaction]) -> Void
    
}

