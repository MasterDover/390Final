//
//  customArray.swift
//  BibleBooks
//
//  Created by csc313 on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit

class customArray: NSMutableArray {
    
    
    func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }

}
