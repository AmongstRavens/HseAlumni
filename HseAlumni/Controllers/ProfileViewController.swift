//
//  ProfileViewController.swift
//  HseAlumni
//
//  Created by Sergey on 2/11/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var personImageView: UIImageView!{
        didSet{
            personImageView.layer.cornerRadius = personImageView.bounds.width / 2
            personImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var pagesScrollView: PagesScrollView!{
        didSet{
            pagesScrollView.pageDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//MARK: -PageScrollViewDelegate
extension ProfileViewController : PagesScrollViewDelegate{
    func descriptorResourceName() -> String {
        return "accountTableViewCellsDescription"
    }
}
