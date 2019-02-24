//
//  PagesScrollView.swift
//  HseAlum
//
//  Created by Sergey on 10/29/17.
//  Copyright © 2017 Бизнес в стиле .RU. All rights reserved.
//

import Foundation
import UIKit


protocol PagesScrollViewDelegate: class{
    func descriptorResourceName() -> String
}

class PagesScrollView : UIScrollView{
    
    //MARK: Fields
    private struct designConstants{
        static var cellHeight : CGFloat = 40
        static var headerHeight : CGFloat = 60
        static var headerStickout : CGFloat = 15
        static var shadowInset: CGFloat = 5
        static var tableViewsBottomOffset : CGFloat = 100
    }
    
    weak var pageDelegate : PagesScrollViewDelegate?{
        didSet{
            if pageDelegate != nil{
                descriptorResourceName = pageDelegate!.descriptorResourceName()
            }
        }
    }
    
    private var descriptorResourceName : String!
    private var customCellsViewModel = CustomCellViewModel()
    private var tableViews = [PageTableView]()
    private var scrollingTableViewIndex : Int = 0
    private var shouldScrollTableView : Bool = false
    
    //MARK: Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        //To make shadow visible
        self.showsVerticalScrollIndicator = false
        self.delegate = self
        self.isScrollEnabled = true
        customCellsViewModel.loadCellDescriptor(for: descriptorResourceName)
        addTableViews(count: customCellsViewModel.numberOfTableViews)
        tableViewUIObserver()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        calculateTableViewsFrames()
        for tableView in tableViews{
            tableView.container.frame.origin = CGPoint(x: 0, y: tableView.origin)
        }
    }
    
    override func layoutSubviews() {
        calculateTableViewsFrames()
    }
    
    private func addTableViews(count: Int){
        for index in 0 ..< count{
            let frame = CGRect.zero
            let container = UIView(frame: frame)
            let tableView = PageTableView(frame: frame, style: .plain)
            tableView.pageIndex = index
            tableView.container = container
            tableView.registerCells()
            tableView.delegate = self
            tableView.dataSource = self
            
            container.addSubview(tableView)
            self.addSubview(container)
            tableViews.append(tableView)
        }
    }
    
    private func calculateTableViewsFrames(){
        //Current height is size.height of added/visible tableView's in scrollView.
        var currentHeight : CGFloat = 0
        //Additional content height of all added/visible tableViews in scrollView, equals to zero height is there's no "large" tableViews, we need it to calculate scrollView's contentHeight.
        var underlyingContentSizeHeight : CGFloat = 0
        
        for index in 0 ..< tableViews.count{
            tableViews[index].layoutIfNeeded()
            tableViews[index].origin = currentHeight + designConstants.shadowInset
            tableViews[index].anchorPoint = tableViews[index].origin + underlyingContentSizeHeight
            
            var size: CGSize!
            if designConstants.headerStickout * CGFloat(index) + tableViews[index].contentSize.height >
                self.frame.height
            {
                //TableView has large contentSize height
                size = CGSize(width: self.frame.size.width, height: self.frame.size.height - (designConstants.headerStickout * CGFloat(index)) - designConstants.headerStickout + designConstants.tableViewsBottomOffset - 15)
                //tableViews[index].isScrollable = true
                underlyingContentSizeHeight += tableViews[index].contentSize.height - size.height + designConstants.tableViewsBottomOffset
                tableViews[index].topAnchorPoint = tableViews[index].origin + underlyingContentSizeHeight
            } else{
                //Standard tableView
                size = CGSize(width: self.frame.size.width, height: tableViews[index].contentSize.height + designConstants.tableViewsBottomOffset)
                //tableViews[index].isScrollable = false
            }
            
            tableViews[index].frame.size = size
            tableViews[index].container.frame.size = size
            tableViews[index].container.layer.shadowPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint.zero, size: size)
                , byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 30)).cgPath
            
            currentHeight += size.height - designConstants.tableViewsBottomOffset
        }
        
        self.contentSize = CGSize(width: self.frame.width, height: ((tableViews.last?.origin ?? 0) + (tableViews.last?.frame.height ?? 0)) + underlyingContentSizeHeight)
        
        //Hide underlining content when bounces up
        tableViews.last?.frame.size.height += self.frame.height
        tableViews.last?.container.frame.size.height += self.frame.height
    }
    
    //MARK: Notification center
    private func tableViewUIObserver(){
        NotificationCenter.default.addObserver(forName: Notification.Name("AccountUIObserver"), object: nil, queue: .main) { (notification) in
            //Handle tapping row
            if let indexOfTableView = notification.userInfo?["index"] as? Int{
                //Should animate here
                self.tableViews[indexOfTableView].reloadData()
                var oldOrigins = [CGFloat]()
                for tableView in self.tableViews{
                    oldOrigins.append(tableView.origin)
                }
                self.calculateTableViewsFrames()
                for index in 0 ..< self.tableViews.count{
                    self.tableViews[index].container.frame.origin.y += self.tableViews[index].origin - oldOrigins[index]
                    self.tableViews[index].container.setNeedsDisplay()
                }
            }
        }
    }
    
}

//MARK:- UITableViewDelegate/DataSource, UIScrollViewDelegate
extension PagesScrollView : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    
    //MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = tableViews.index(of: tableView as! PageTableView)!
        let cellDescriptor = customCellsViewModel.getCellDescriptior(for: indexPath, index: index)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellDescriptor["cellIdentifier"] as! String, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let index = tableViews.index(of: tableView as! PageTableView){
            return customCellsViewModel.numberOfRows(for: index)
        } else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = tableViews.index(of: tableView as! PageTableView){
            let cellType = customCellsViewModel.handleTappingRow(at: indexPath, for: index)
            if cellType == DropdownTableViewCell.defaultReuseIdentifier{
                let cell = tableView.cellForRow(at: indexPath) as! DropdownTableViewCell
                cell.rotateButton()
            }
        }
    }
    
    //MARK: TableView header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed(PageTableViewHeaderView.defaultReuseIdentifier, owner: self, options: nil)?.first as! PageTableViewHeaderView
        headerView.headerLabel.text = "Header Label Text"
        headerView.parent = tableView as? PageTableView
        (tableView as? PageTableView)?.customHeaderView = headerView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return designConstants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return designConstants.headerHeight
    }
    
    //MARK:- UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        guard scrollView == self else{
            return
        }
        if shouldScrollTableView{
            //Scroll page's tableView
            //        print(y)
            tableViews[scrollingTableViewIndex].contentOffset.y += y
            scrollView.contentOffset.y = 0
        } else{
            //Scroll pages
            if y >= 0{
                tableViews.forEach{$0.pinPageIfNeeded(scrollingYOffset: y, headerOffset: designConstants.headerStickout, shadowInset: designConstants.shadowInset)}
            } else {
                tableViews.forEach{$0.handleNegativeScrollingOffset(scrollingYOffset: y)}
            }
        }
    }
}

//MARK:- PageScrollingDelegate
extension PagesScrollView : PageTableViewDelegate{
    func shouldScrollTableView(at index: Int) {
        scrollingTableViewIndex = index
        shouldScrollTableView = true
    }
}
