//
//  Item.swift
//  DemoOnRealm
//
//  Created by volive solutions on 07/01/19.
//  Copyright © 2019 volive solutions. All rights reserved.
//

import UIKit
import RealmSwift

class Item: Object {
    
    @objc dynamic var ID = -1
    @objc dynamic var textString = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
}
