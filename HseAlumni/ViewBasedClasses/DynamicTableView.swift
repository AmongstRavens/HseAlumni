//
//  DynamicTableView.swift
//  HseAlum
//
//  Created by Sergey on 10/10/17.
//  Copyright © 2017 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

protocol DynamicTableViewDelegate : class{
    func shouldScrollTableView(at index: Int)
}

enum PageState{
    case Pinned
    case Free
    case Scrolling
}

class DynamicTableView: UITableView {
    weak var pageDelegate : DynamicTableViewDelegate?
    var pageIndex : Int!
    private var state : PageState = .Free
    var origin : CGFloat = 0.0
    var topAnchorPoint : CGFloat = 0.0
    var anchorPoint : CGFloat = 0.0
    var customHeaderView: TableViewHeaderView?
    var container: UIView!{
        didSet{
            container.layer.shadowColor = UIColor.lightGray.cgColor
            container.layer.shadowOffset = CGSize.zero
            container.layer.shadowRadius = 3
            container.layer.shadowOpacity = 1
            container.layer.cornerRadius = 30
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .white
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 20))
    }
    
    func registerCells(){
        register(BasicTableViewCell.self)
        register(DropdownTableViewCell.self)
        register(AddItemTableViewCell.self)
        register(SwitchTableViewCell.self)
    }
    
    func pinPageIfNeeded(scrollingYOffset: CGFloat ,headerOffset: CGFloat, shadowInset: CGFloat){
        if scrollingYOffset > anchorPoint - (headerOffset * CGFloat(pageIndex) + shadowInset){
            container.frame.origin.y = scrollingYOffset + headerOffset * CGFloat(pageIndex) + shadowInset
            state = .Pinned
        } else{
            if anchorPoint == origin{
                container.frame.origin.y = origin
            }
            state = .Free
        }
    }
    
    func handleNegativeScrollingOffset(scrollingYOffset: CGFloat){
        //This provides scrolldown effect
        //Change 0.8 constant to increase velocity and 0.1 to provide more/less slide out effect
        state = .Free
        container.frame.origin.y = scrollingYOffset * (0.8 - CGFloat(Double(pageIndex) * 0.1)) + origin
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 30
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.2
        clipsToBounds = true
    }
}
