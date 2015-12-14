//
//  MainController.swift
//  BibleBooks
//
//  Created by csc313 on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import UIKit
import Parse

class MainController: UIViewController {

    @IBOutlet weak var theTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let query = PFQuery(className:"Roll")
        query.whereKey("owner_id", equalTo: PhoneCore.currentUser)
        query.findObjectsInBackgroundWithBlock { (objects : [PFObject]?, error: NSError?) -> Void in
            if(objects != nil)
            {
                PhoneCore.theRowData = objects!
                self.theTableView.reloadData()
            }
            else
            {
                print("None Found")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
