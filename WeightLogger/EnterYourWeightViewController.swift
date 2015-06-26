//
//  EnterYourWeightViewController.swift
//  WeightLogger
//
//  Created by Duke Yao on 2015/6/26.
//  Copyright (c) 2015年 Duke Yao Company. All rights reserved.
//

import UIKit
import CoreData

class EnterYourWeightViewController: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet var txtWeight: UITextField!
    
    @IBOutlet var units: UISwitch!
    
    
    @IBAction func btnSavePressed(sender: AnyObject) {
        //save data
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("UserWeights", inManagedObjectContext: context)
        
        //Instance of our custom class, referenece to entity
        var newWeight = UserWeights(entity: ent!, insertIntoManagedObjectContext: context)
        
        //Fill in the Core Data
        newWeight.weight = txtWeight.text
        if(units.on){
            newWeight.units = "lbs"
        }else{
            //Switch is off
            newWeight.units = "kgs"
        }
        
        let dateFormatter = NSDateFormatter()
        var curLocale: NSLocale = NSLocale.currentLocale()
        var formatString: NSString = NSDateFormatter.dateFormatFromTemplate("EdMMM h:mm a", options: 0, locale: curLocale)!
        dateFormatter.dateFormat = formatString as String
        newWeight.date = dateFormatter.stringFromDate(NSDate())
        
        context.save(nil)
        txtWeight.text = ""
        
        println(newWeight)
        println(NSDate())
        
        
        
    }
    
    
    //Hide the keyboard
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        txtWeight.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    
    
}
