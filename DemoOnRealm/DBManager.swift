//
//  DBManager.swift
//  DemoOnRealm
//
//  Created by volive solutions on 07/01/19.
//  Copyright © 2019 volive solutions. All rights reserved.
//


import UIKit
import RealmSwift

class DBManager {
    
     private var database:Realm
     static let sharedInstance = DBManager()
    
     private init() {
        
        database = try! Realm()
        
     }
    
    //MARK:- GET DATA FROM  DB
    func getDataFromDB() -> Results<Item> {
        
        let results: Results<Item> = database.objects(Item.self)
        return results
    }
    
    
    //MARK:- ADD DATA FROM DB
    func addData(object: Item) {
        
        try! database.write {
            database.add(object, update: false)
            print("Added new object")
        }
    }
    
    
    //MARK:- UPDATE DATA
    //MARK:- ADD DATA FROM DB
    func upDateData(object: Item) {
        
        try! database.write {
            
            database.add(object, update: true)
            print("Added new object")
        }
    }
    
    //MARK:- DELETE ALL DATABASE
    
    func deleteAllDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
    
    //MARK:- DELETE FROM DB
    func deleteFromDb(object: Item) {
        
        try! database.write {
            
            database.delete(object)
        }
    }
    
}
