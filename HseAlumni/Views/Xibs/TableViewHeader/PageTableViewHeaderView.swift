//
//  PageTableViewHeaderView.swift
//  HseAlumni
//
//  Created by Sergey on 2/12/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class PageTableViewHeaderView: UIView, ReusableView, NibLoadableView{
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var parent : PageTableView?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 30
    }
    
    func setShadow(){
        
    }
    
    func removeShadow(){
        
    }
    
}

