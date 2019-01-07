//
//  ViewController.swift
//  DemoOnRealm
//
//  Created by volive solutions on 07/01/19.
//  Copyright © 2019 volive solutions. All rights reserved.
//

import UIKit
import RealmSwift



class ViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    var selectedRows:[IndexPath] = []
    var numberArray = ["1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.allowsSelection = true
         print(Realm.Configuration.defaultConfiguration.fileURL!)
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    //MARK:- Add BTN Action
    @IBAction func addBtnAction(_ sender: Any) {
      self.selectedRows = getAllIndexPaths()
        self.myTableView.reloadData()
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
//
//        vc.currentItem = nil
//        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func checkBoxSelection(_ sender:UIButton)
    {
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        if self.selectedRows.contains(selectedIndexPath)
        {
            self.selectedRows.remove(at: self.selectedRows.index(of: selectedIndexPath)!)
        }
        else
        {
            self.selectedRows.append(selectedIndexPath)
        }
        self.myTableView.reloadData()
    }
    
    
    func getAllIndexPaths() -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        for j in 0..<myTableView.numberOfRows(inSection: 0) {
            indexPaths.append(IndexPath(row: j, section: 0))
        }
        return indexPaths
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
       // return DBManager.sharedInstance.getDataFromDB().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! CustomTableViewCell
     
//      let index = Int(indexPath.row)
//      let item = DBManager.sharedInstance.getDataFromDB()[index] as Item
        
        cell.textLbl?.text = numberArray[indexPath.row]
        print("selected row",selectedRows)
        if selectedRows.contains(indexPath)
        {
            print("selected row")
             cell.checkBtn.tintColor = UIColor.blue
            cell.checkBtn.setImage(UIImage(named:"check"), for: .normal)
        }
        else
        {
           cell.checkBtn.setImage(UIImage(named:"uncheck"), for: .normal)
            cell.checkBtn.tintColor = UIColor.lightGray
            print("else selected row")
        }
        cell.checkBtn.tag = indexPath.row
        cell.checkBtn.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if( indexPath.row > -1) {

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC

            let index = Int(indexPath.row)
            let item = DBManager.sharedInstance.getDataFromDB()[index] as Item

            vc.currentItem = item
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

