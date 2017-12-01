//
//  SyncHandler.swift
//  Babilon2
//
//  Created by yuya on 2017/11/26.
//  Copyright © 2017年 yuya. All rights reserved.
//

import UIKit

struct SyncHandler {
    
    let didChangeProgress: (Int64, Int64) -> Void
    let didFinished: VoidBlock
    
}

