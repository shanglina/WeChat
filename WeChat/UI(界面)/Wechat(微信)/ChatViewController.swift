//
//  WechatViewController.swift
//  WeChat
//
//  Created by N年後 on 15/9/23.
//  Copyright © 2015年 N年後. All rights reserved.
//

import UIKit





class ChatViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!

    /// 创建菜单数据
    lazy var items: Array<MenuItemModel> = {
        var items = [MenuItemModel]()
        items.append(MenuItemModel(title: "发起群聊", image: UIImage(named: "contacts_add_newmessage")))
        items.append(MenuItemModel(title: "添加朋友", image: UIImage(named: "contacts_add_friend")))
        items.append(MenuItemModel(title: "扫一扫", image: UIImage(named: "contacts_add_scan")))
        items.append(MenuItemModel(title: "收钱", image: UIImage(named: "contacts_add_money")))
        return items
        }()


    override func viewDidLoad() {
        super.viewDidLoad()



        // 初始化导航条上的内容
        setNav()

    }

    private func setNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "barbuttonicon_add", highlImageName: "barbuttonicon_add", targer: self, action: "addClick:")
        self.automaticallyAdjustsScrollViewInsets = false
    }

    func addClick(sender:UIBarButtonItem) {

        let rect = CGRectMake(kSCREEN_WIDTH - 35, -30, 20, 30);
        PopoverController.sharedInstance.showPopoverController(rect, view: self.view, items: self.items) { (index) -> Void in
            print(self.items[index].title)
        }


    }


    private func setweChatTableView() {


    }






    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//MARK:- UITableViewDelegate和UITableViewDataSource
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {



    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ChatTableViewCell.chatCellWithTableView(tableView)

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {


    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }


    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
}

