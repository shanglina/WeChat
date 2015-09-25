//
//  MainLeadpageViewController.swift
//  WeChat
//
//  Created by N年後 on 15/9/23.
//  Copyright © 2015年 N年後. All rights reserved.
//

import UIKit

public let SD_ShowMianTabbarController_Notification = "SD_Show_MianTabbarController_Notification"

class MainLeadpageViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!

    @IBAction func showMainTabbar(sender: UIButton) {

        NSNotificationCenter.defaultCenter().postNotificationName(SD_ShowMianTabbarController_Notification, object: nil)


        /// 作为初始窗体
        /*
        let vc = UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        */

        /// 设置了 StoryBoard ID
        /*
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainTabBar") as! MainTabBarController
        self.navigationController?.pushViewController(vc, animated: true)
        */
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
