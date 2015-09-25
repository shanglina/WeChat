//
//  MainNavigationController.swift
//  WeChat
//
//  Created by N年後 on 15/9/23.
//  Copyright © 2015年 N年後. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        setGestureRecognizer()

    }


    func setGestureRecognizer(){

        // 获取系统自带滑动手势的target对象
        let target = self.interactivePopGestureRecognizer!.delegate

        // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
        let pan = UIPanGestureRecognizer(target: target, action: Selector("handleNavigationTransition:"))

        // 设置手势代理，拦截手势触发
        pan.delegate = self;

        // 给导航控制器的view添加全屏滑动手势
        self.view.addGestureRecognizer(pan)

        // 禁止使用系统自带的滑动手势
        self.interactivePopGestureRecognizer?.enabled = false
    }


    /// 创建一个返回按钮
    lazy var backBtn: UIButton = {
        //设置返回按钮属性
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
        backBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        backBtn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        backBtn.setImage(UIImage(named: "back_1"), forState: .Normal)
        backBtn.setImage(UIImage(named: "back_2"), forState: .Highlighted)
        backBtn.addTarget(self, action: "backBtnClick", forControlEvents: .TouchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0)
        backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        let btnW: CGFloat = kSCREEN_WIDTH > 375.0 ? 50 : 44
        backBtn.frame = CGRectMake(0, 0, btnW, 40)
        return backBtn
        }()


    override func pushViewController(viewController: UIViewController, animated: Bool) {

        if(self.viewControllers.count>0){
            setBackBarButtonItem(viewController)
            viewController.hidesBottomBarWhenPushed = true;
        }

        super.pushViewController(viewController, animated: animated)
    }

    /**
    自定义返回按钮

    - parameter viewController: 视图控制器
    */
    func setBackBarButtonItem(viewController: UIViewController){

        let vc = self.childViewControllers[0]

        if self.childViewControllers.count == 1 {
            backBtn.setTitle(vc.tabBarItem.title!, forState: .Normal)
        } else {
            backBtn.setTitle("返回", forState: .Normal)
        }

        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)

    }


    /** 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
    拦截手势触发

    - parameter gestureRecognizer: 触发手势

    - returns: 是否需要触发手势
    */
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
        // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
        if (self.childViewControllers.count == 1) {
            // 表示用户在根控制器界面，就不需要触发滑动手势，
            return false;
        }
        return true;
    }

}
