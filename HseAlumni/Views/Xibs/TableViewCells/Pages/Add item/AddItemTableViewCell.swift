//
//  AddItemTableViewCell.swift
//  HseAlumni
//
//  Created by Sergey on 2/22/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class AddItemTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset.left = 20
        separatorInset.right = 20
    }
}
