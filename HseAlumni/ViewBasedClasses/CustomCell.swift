//
//  customCell.swift
//  HseAlum
//
//  Created by Sergey on 9/29/17.
//  Copyright © 2017 Бизнес в стиле .RU. All rights reserved.
//

import Foundation
import UIKit

class CustomCell : UITableViewCell{
    
    //MARK: Xib outlets
    @IBOutlet weak var switchCellLabel: UILabel!
    @IBOutlet weak var switchCellSwitch: UISwitch!{
        didSet{
            if switchCellSwitch != nil{
            }
        }
    }
    @IBOutlet weak var dropdownCellImageView: UIImageView!
    @IBOutlet weak var dropdownCellLabel: UILabel!
    @IBOutlet weak var addItemCellLabel: UILabel!
    @IBOutlet weak var addItemCellButton: UIButton!
    
    
    //MARK: Outlet actions
    @IBOutlet weak var dropdownButtonPressed: UIButton!
    
    
    private var dropdownState : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset.left = 20
        separatorInset.right = 20
    }
    
    
}
