//
//  UserWeights.swift
//  WeightLogger
//
//  Created by Duke Yao on 2015/6/26.
//  Copyright (c) 2015年 Duke Yao Company. All rights reserved.
//

import UIKit
import CoreData

@objc(UserWeights)
class UserWeights: NSManagedObject {
   
    @NSManaged var weight: String
    @NSManaged var date: String
    @NSManaged var units: String
}
