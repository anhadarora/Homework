//
//  DaysTableViewCell.swift
//  frameworkApp
//
//  Created by Anhad Arora on 5/7/15.
//  Copyright (c) 2015 Anhad Arora. All rights reserved.
//

import UIKit

class DaysTableViewCell: UITableViewCell {
    
    @IBOutlet weak var daySwitch: UISwitch!

    @IBAction func daySwitchClicked(sender: AnyObject) {
        if daySwitch.on {
            println("Switch is now off")
            daySwitch.setOn(false, animated:true)
            SetAlarmViewController().days.updateValue(false, forKey: self.textLabel!.text!)
        } else {
             println("Switch is now on")
            daySwitch.setOn(true, animated:true)
            SetAlarmViewController().days.updateValue(true, forKey: self.textLabel!.text!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
