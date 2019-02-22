//
//  BasicTableViewCell.swift
//  HseAlumni
//
//  Created by Sergey on 2/22/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset.left = 20
        separatorInset.right = 20
    }
}
