//
//  secondIC.swift
//  BibleBooks
//
//  Created by csc313 on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit
import Foundation


class secondIC: WKInterfaceController {

    @IBOutlet var thePicker: WKInterfacePicker!
    @IBOutlet var numGuesses: WKInterfaceLabel!
    @IBOutlet var wrongGuesses: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        var thePickerItems = [WKPickerItem]()
        let labelNames = Core.finishedBooksArray
        for(var i = 0; i < labelNames.count; i++)
        {
            thePickerItems.append(WKPickerItem())
            thePickerItems[i].title = labelNames[i]
        }
        
        self.thePicker.setItems(thePickerItems)
        
        
        numGuesses.setText("Total Guesses: \(Core.numGuess)")
        wrongGuesses.setText("Wrong Guesses: \(Core.wronGuess)")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
