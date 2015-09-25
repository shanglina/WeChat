//
//  MainTableView.swift
//  WeChat
//
//  Created by N年後 on 15/9/23.
//  Copyright © 2015年 N年後. All rights reserved.
//


// 对TableView共同代码的抽取

import UIKit

class MainTableView: UITableView {

    init(frame: CGRect, style: UITableViewStyle, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        super.init(frame: frame, style: style)
        self.delegate = delegate
        self.dataSource = dataSource
        separatorStyle = .None
        backgroundColor = UIColor.groupTableViewBackgroundColor()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
