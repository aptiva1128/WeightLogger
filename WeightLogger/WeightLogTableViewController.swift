//
//  WeightLogTableViewController.swift
//  WeightLogger
//
//  Created by Duke Yao on 2015/6/26.
//  Copyright (c) 2015年 Duke Yao Company. All rights reserved.
//

import UIKit
import CoreData

class WeightLogTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var totalEntries: Int = 0
    
    @IBOutlet var tbLog: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context = appDel.managedObjectContext

        var request = NSFetchRequest(entityName: "UserWeights")
        request.returnsObjectsAsFaults = false
        
        totalEntries = context!.countForFetchRequest(request, error: nil)
        //println(totalEntries)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return totalEntries
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        var appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context = appDel.managedObjectContext
        var request = NSFetchRequest(entityName: "UserWeights")
        request.returnsObjectsAsFaults = false
        
        var results: NSArray = context!.executeFetchRequest(request, error: nil)!
        
        //get constants and put into cell
        var thisWeight: UserWeights = results[indexPath.row] as! UserWeights
        cell.textLabel?.text = thisWeight.weight + " " + thisWeight.units
        cell.detailTextLabel?.text = thisWeight.date
        return cell
    }
   
  
}
