//
//  TableViewHeaderView.swift
//  HseAlumni
//
//  Created by Sergey on 2/12/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class TableViewHeaderView: UIView, ReusableView, NibLoadableView{
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var parent : DynamicTableView?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 30
    }
    
    func setShadow(){
        
    }
    
    func removeShadow(){
        
    }
    
}

