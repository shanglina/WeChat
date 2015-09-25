//
//  MainTabBarController.swift
//  WeChat
//
//  Created by N年後 on 15/9/23.
//  Copyright © 2015年 N年後. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAllChildViewController()

        self.setValue(MainTabBar(), forKey: "tabBar")
    }


    /// 初始化所有子控制器
    private func setUpAllChildViewController() {

        // 微信
        let wechatViewController = UIStoryboard(name: "Wechat", bundle: nil).instantiateInitialViewController() as! ChatViewController
        tabBaraAddChildViewController(vc: wechatViewController, title: "微信", imageName: "tabbar_mainframe", selectedImageName: "tabbar_mainframeHL")
        // 通讯录
        let contactsViewController = UIStoryboard(name: "Contacts", bundle: nil).instantiateInitialViewController() as! ContactsViewController
        tabBaraAddChildViewController(vc: contactsViewController, title: "通讯录", imageName: "tabbar_contacts", selectedImageName: "tabbar_contactsHL")
        // 发现
        let findViewController = UIStoryboard(name: "Find", bundle: nil).instantiateInitialViewController() as! FindViewController
        tabBaraAddChildViewController(vc: findViewController, title: "发现", imageName: "tabbar_discover", selectedImageName: "tabbar_discoverHL")
        // 我
        let meViewController = UIStoryboard(name: "Me", bundle: nil).instantiateInitialViewController() as! MeViewController
        tabBaraAddChildViewController(vc: meViewController, title: "我", imageName: "tabbar_me", selectedImageName: "tabbar_meHL")

    }

    private func tabBaraAddChildViewController(vc vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName)!.imageWithRenderingMode( UIImageRenderingMode.AlwaysOriginal))
        vc.view.backgroundColor = Theme.kBackgroundColor
        let titleTextDic = NSDictionary(object: UIColor(red: 31/255, green: 185/255, blue: 34/255, alpha: 1),forKey:   NSForegroundColorAttributeName)
        vc.tabBarItem.setTitleTextAttributes(titleTextDic as? [String : AnyObject], forState: UIControlState.Selected)
        let nav = MainNavigationController(rootViewController: vc)
        addChildViewController(nav)
    }

}

class MainTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translucent = false
        self.backgroundImage = UIImage(named: "tabbar")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}
