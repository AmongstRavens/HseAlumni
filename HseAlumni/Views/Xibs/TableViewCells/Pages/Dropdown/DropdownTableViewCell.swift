//
//  DropdownTableViewCell.swift
//  HseAlumni
//
//  Created by Sergey on 2/22/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class DropdownTableViewCell: UITableViewCell, ReusableView, NibLoadableView{

    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    private var dropdownState : Bool = false

    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset.left = 20
        separatorInset.right = 20
    }
    
    func rotateButton(){
        if dropdownState == false{
            //Clockwise rotation
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                if self.arrowImageView != nil{
                    self.arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
                }
            }, completion: { (flag) in
                self.dropdownState = true
            })
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                if self.arrowImageView != nil{
                    self.arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
                }
            }, completion: { (flag) in
                self.dropdownState = false
            })
        }
    }
}
