//
//  ScheduleCell.swift
//  PD
//
//  Created by David on 5/7/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class ScheduleCell: UITableViewCell {
    
    static let identifier = "ScheduleCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(schedule: Schedule) {
        nameLabel.text = schedule.name ?? ""
    }
}
