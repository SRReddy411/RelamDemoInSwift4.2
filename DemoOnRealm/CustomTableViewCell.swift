//
//  CustomTableViewCell.swift
//  DemoOnRealm
//
//  Created by volive solutions on 07/01/19.
//  Copyright © 2019 volive solutions. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var checkBtn: UIButton!
    
    @IBOutlet var textLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
