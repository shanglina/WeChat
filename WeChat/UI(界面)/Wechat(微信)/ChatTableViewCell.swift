//
//  ChatTableViewCell.swift
//  WeChat
//
//  Created by N年後 on 15/9/25.
//  Copyright © 2015年 fupengli. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    class func chatCellWithTableView(tableView: UITableView) -> ChatTableViewCell {
        let identifier = "ChatTableViewCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? ChatTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ChatTableViewCell", owner: nil, options: nil).last as? ChatTableViewCell
        }

        return cell!
    }

    
}
