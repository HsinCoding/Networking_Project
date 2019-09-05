//
//  CustomTableViewCell.swift
//  Networking_Project
//
//  Created by ＵＳＥＲ on 2019/9/3.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var parameterName2: UILabel!
    @IBOutlet weak var parameterUnit2: UILabel!
    @IBOutlet weak var parameterName3: UILabel!
    @IBOutlet weak var parameterUnit3: UILabel!
    @IBOutlet weak var parameterName1: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.backgroundColor = UIColor.init(red: 100, green: 100, blue: 100, alpha: 1)
    }
    
}
