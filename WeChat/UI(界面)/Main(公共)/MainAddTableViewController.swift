//
//  MainAddTableViewController.swift
//  WeChat
//
//  Created by N年後 on 15/9/24.
//  Copyright © 2015年 fupengli. All rights reserved.
//

import UIKit



public typealias MenuItemBlock = (index:Int)->Void



class PopoverController:NSObject,WYPopoverControllerDelegate {
    static let sharedInstance = PopoverController()
    private override init() {} // 这就阻止其他对象使用这个类的默认的'()'初始化方法


    private var popoverController:WYPopoverController!


    func showPopoverController(rect:CGRect,view:UIView,items:Array<MenuItemModel>,menuItemBlock:MenuItemBlock){
        let mainAdd = MainAddTableViewController()
        mainAdd.menuItemBlock = { (index:Int) -> Void in
            self.popoverController.dismissPopoverAnimated(true)
            menuItemBlock(index: index)
            return Void()
        }


        mainAdd.items = items
        mainAdd.preferredContentSize = CGSizeMake(150,  CGFloat(44 * items.count  +  1))
        mainAdd.modalInPopover = false

        let theme = WYPopoverTheme.themeForIOS7()
        theme.tintColor = Theme.kBarTintColor.colorWithAlphaComponent(0.9)
        theme.arrowHeight = 6;
        theme.arrowBase = 12;


        popoverController = WYPopoverController(contentViewController: mainAdd)
        popoverController.delegate = self
        popoverController.popoverLayoutMargins = UIEdgeInsetsMake(10, 12, 10, 12);
        popoverController.wantsDefaultContentAppearance = true
        popoverController.theme = theme;

        popoverController.presentPopoverFromRect(rect, inView: view, permittedArrowDirections: WYPopoverArrowDirection.Up, animated: true, options: WYPopoverAnimationOptions.FadeWithScale)


    }



    func popoverControllerShouldDismissPopover(popoverController: WYPopoverController!) -> Bool {

        return true
    }


    func popoverControllerDidDismissPopover(popoverController: WYPopoverController!) {
        self.popoverController.delegate = nil
        self.popoverController = nil
    }
    
    
    
}






class MainAddTableViewController: UITableViewController {

    var items = [MenuItemModel]()
    var menuItemBlock:MenuItemBlock?


    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = 44;
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorColor = UIColor(hexString:"#4f5468")
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 12, 0, 12)
        self.tableView.scrollEnabled = false;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.font = UIFont.systemFontOfSize(15)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.clearColor()
        cell.backgroundView = nil

        let  backgroudView = UIView()
        backgroudView.backgroundColor =  UIColor.whiteColor().colorWithAlphaComponent(0.15)
        cell.selectedBackgroundView = backgroudView

        let item = items[indexPath.row]
        cell.imageView?.image = item.image
        cell.textLabel?.text = item.title
        // Configure the cell...

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        self.menuItemBlock!(index:indexPath.row)
    }



}



class MenuItemModel: NSObject {

    var title: String?
    var image: UIImage?


    init(title: String?, image: UIImage?) {
        self.title = title
        self.image = image
        
    }
    
    
}


