//
//  MainIC.swift
//  BibleBooks
//
//  Created by csc313 on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit
import Foundation


class MainIC: WKInterfaceController {

    
    @IBOutlet var theTable: WKInterfaceTable!
    var labelNames = [String]()
    var currBook = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        var usedNums = [Int]()
        
        
        for(var i = 0; i < Core.bibleBooksArray.count; i++)
        {
            
            var num = Int(arc4random_uniform(UInt32(Core.bibleBooksArray.count)))
            
                while(usedNums.contains(num))
                {
                    num = Int(arc4random_uniform(UInt32(Core.bibleBooksArray.count)))
                }
            
            usedNums.append(num)
            labelNames.append(Core.bibleBooksArray[num])
        }
        
        self.theTable.setNumberOfRows(Core.bibleBooksArray.count, withRowType: "cell")
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! customRow
            currRow.theLabel.setText(labelNames[i])
        }
        
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func startButton() {
        
        var usedNums = [Int]()
        labelNames.removeAll()
        
        for(var i = 0; i < Core.bibleBooksArray.count; i++)
        {
            
            var num = Int(arc4random_uniform(UInt32(Core.bibleBooksArray.count)))
            
            while(usedNums.contains(num))
            {
                num = Int(arc4random_uniform(UInt32(Core.bibleBooksArray.count)))
            }
            
            usedNums.append(num)
            labelNames.append(Core.bibleBooksArray[num])
        }
        
        self.theTable.setNumberOfRows(Core.bibleBooksArray.count, withRowType: "cell")
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! customRow
            currRow.theLabel.setText(labelNames[i])
        }

        Core.finishedBooksArray.removeAll()
        
        currBook = 0
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        
        if(labelNames[rowIndex] == Core.bibleBooksArray[currBook])
        {
            Core.finishedBooksArray.append(labelNames[rowIndex])
            let currRow = self.theTable.rowControllerAtIndex(rowIndex) as! customRow
            currRow.theLabel.setText("")
            Core.numGuess++
            currBook++
            
            if(Core.finishedBooksArray.count == Core.bibleBooksArray.count)
            {
                self.presentControllerWithName("SecondIC", context: "")
                
            }
            
        }
        else
        {
            Core.numGuess++
            Core.wronGuess++
        }
        
        
    }

}
