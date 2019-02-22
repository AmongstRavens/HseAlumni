//
//  SwitchTableViewCell.swift
//  HseAlumni
//
//  Created by Sergey on 2/22/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell, ReusableView, NibLoadableView{

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellSwitch.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        separatorInset.left = 20
        separatorInset.right = 20
    }
}
