//
//  StringConstant.swift
//  LWMusic
//
//  Created by 十年後 on 15/4/18.
//  Copyright (c) 2015年 NNianHou. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 常量定义


//常量以小写k开头,其余大写;可以配上下划线
//Swift的常量,使用let定义常量


struct Theme {
    ///  APP导航条barButtonItem文字大小
    static let kNavItemFont: UIFont = UIFont.systemFontOfSize(16)
    ///  APP导航条titleFont文字大小
    static let kNavTitleFont: UIFont = UIFont.systemFontOfSize(18)
    /// ViewController的背景颜色
    static let kBackgroundColor: UIColor = UIColor.colorWith(255, green: 255, blue: 255, alpha: 1)
    /// webView的背景颜色
    static let kWebViewBacagroundColor: UIColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)

    /// 导航栏背景颜色
    static let kBarTintColor: UIColor = UIColor.colorWith(47, green: 46, blue: 51, alpha: 1)
}

/*-----------------------------------文件--------------------------------------*/
/// cache文件路径
let cachesPath: String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last!


/*-----------------------------------界面尺寸--------------------------------------*/

/* 导航栏高度 */
let kNavigationH = 64
/* 工具栏高度 */
let kTabBarHeight = 49

public let kSCREEN_WIDTH  = UIScreen.mainScreen().bounds.size.width
public let kSCREEN_HEIGHT  = UIScreen.mainScreen().bounds.size.height
public let kMainBounds: CGRect = UIScreen.mainScreen().bounds


//RGBA函数定义
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor
{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


/*------------------------------------设备信息---------------------------------------*/



/*------------------------------------加载图片---------------------------------------*/
func kloadNibNamed(nibName:String)-> AnyObject{
    
    return NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil).first!
}

func kNib(nibName:String)-> UINib{
    
    return UINib(nibName: nibName, bundle: nil)
}

/*------------------------------------视图------------------------------------------*/
/* 加载NIB文件 */

// MARK: - ViewW
func kViewW (v:UIView) -> CGFloat
{
    return v.frame.size.width
}
// MARK: - ViewH
func kViewH (v:UIView) -> CGFloat
{
    return v.frame.size.height
}
// MARK: - ViewX
func kViewX (v:UIView) -> CGFloat
{
    return v.frame.origin.x
}
// MARK: - ViewY
func kViewY (v:UIView) -> CGFloat
{
    return v.frame.origin.y
}
// MARK: - ViewXW
func kViewXW (v:UIView) -> CGFloat
{
    return v.frame.origin.x + v.frame.size.width
}
// MARK: - ViewYH
func kViewYH (v:UIView) -> CGFloat
{
    return v.frame.origin.y + v.frame.size.height
}


/*-----------------------------------调试相关--------------------------------------*/
