//
//  SecondVC.swift
//  DemoOnRealm
//
//  Created by volive solutions on 07/01/19.
//  Copyright © 2019 volive solutions. All rights reserved.
//

import UIKit

class SecondVC: UIViewController,UITextFieldDelegate {
    
    var currentItem:Item?
    @IBOutlet var enterTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let item = currentItem {
            enterTF.text = item.textString
        }
        
    }
    
    
    //MARK:- SAVE BTN ACTION
    @IBAction func saveBtnAction(_ sender: Any) {
        
        let item = Item()
        
        if(currentItem == nil) {
            item.ID = DBManager.sharedInstance.getDataFromDB().count
        }
        
        item.textString = enterTF.text!
        DBManager.sharedInstance.addData(object: item)
        self.dismiss(animated: true) { }
    }
    
    //MARK:- DELETE BTN ACTION
    @IBAction func deleteBtnAction(_ sender: Any) {
        if let item = currentItem {
            DBManager.sharedInstance.deleteFromDb(object: item)
            self.dismiss(animated: true) { }
        }
    }
    
    
    //MARK:- DELETE ALL DATA From DB

    @IBAction func deleteAllBtnAction(_ sender: Any) {
        DBManager.sharedInstance.deleteAllDatabase()
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- TextFiledDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
