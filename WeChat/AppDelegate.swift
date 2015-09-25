//
//  AppDelegate.swift
//  WeChat
//
//  Created by N年後 on 15/9/23.
//  Copyright © 2015年 N年後. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let mainLeadpageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! MainLeadpageViewController
    



    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        setKeyWindow()

        setAppAppearance()


        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMianViewController", name: SD_ShowMianTabbarController_Notification, object: nil)

        return true
    }

    /**
    设置KeyWindow

    */
    private func setKeyWindow() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        window?.rootViewController = showLeadpage()

        window?.makeKeyAndVisible()
    }

    /**
    引导页设置

    - returns: UIViewController
    */
    private func showLeadpage() -> UIViewController {
        let versionStr = "CFBundleShortVersionString"
        let cureentVersion = NSBundle.mainBundle().infoDictionary![versionStr] as! String
        let oldVersion = (NSUserDefaults.standardUserDefaults().objectForKey(versionStr) as? String) ?? ""

        if cureentVersion.compare(oldVersion) == NSComparisonResult.OrderedDescending {
            NSUserDefaults.standardUserDefaults().setObject(cureentVersion, forKey: versionStr)
            NSUserDefaults.standardUserDefaults().synchronize()
            return mainLeadpageViewController
        }
        return MainTabBarController()
    }


    //MARK: - 设置
    func setAppAppearance() {
        let itemAppearance = UITabBarItem.appearance()
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Selected)
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Normal)

        //设置导航栏主题
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barTintColor = Theme.kBarTintColor
        // 设置导航titleView字体
        navAppearance.translucent = false
        navAppearance.titleTextAttributes = [NSFontAttributeName : Theme.kNavTitleFont, NSForegroundColorAttributeName : UIColor.whiteColor()]

        let item = UIBarButtonItem.appearance()
        item.setTitleTextAttributes([NSFontAttributeName : Theme.kNavItemFont, NSForegroundColorAttributeName : UIColor.blackColor()], forState: .Normal)
    }


    /**
    Description
    */
    func showMianViewController() {
        self.window!.rootViewController = MainTabBarController()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

