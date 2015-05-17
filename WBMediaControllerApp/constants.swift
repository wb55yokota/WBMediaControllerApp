//
//  constants.swift
//  WBMediaControllerApp
//
//  Created by YOKOTA, Kenji on 2015/02/10.
//  Copyright (c) 2015年 wb55. All rights reserved.
//

import Foundation

let APP:AppDelegate = UIApplication.sharedApplication().delegate! as! AppDelegate
//let SCREEN_BOUNDS   ([UIScreen mainScreen].bounds)
//let Log(A, ...) = NSLog(@"DEBUG: %s:%d:%@", __PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:A, ## __VA_ARGS__]);
//let RGB(r, g, b) = [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
//let RGBA(r, g, b, a) = [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
let IS_IPHONE:Bool = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone
let IS_IPAD:Bool = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad
let IS_OVER_IOS6:Bool = (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 6.0
let IS_OVER_IOS7:Bool = (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 7.0
let IS_OVER_IOS8:Bool = (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0
let IS_IPHONE6PLUS:Bool = UIScreen.mainScreen().bounds.size.height == 736
let IS_IPHONE6:Bool = UIScreen.mainScreen().bounds.size.height == 667
let IS_IPHONE5:Bool = UIScreen.mainScreen().bounds.size.height == 568
let IS_RETINAHD:Bool = UIScreen.mainScreen().respondsToSelector("scale") && UIScreen.mainScreen().scale == 3.0
let IS_RETINA:Bool = UIScreen.mainScreen().respondsToSelector("scale") && UIScreen.mainScreen().scale == 2.0

let STATUSBAR_H:CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
let TABBAR_H:CGFloat    = 49
let NAVBAR_H:CGFloat    = 44
let TOOLBAR_H:CGFloat   = 44
let KEYBOARD_H:CGFloat  = 216
let SCREEN_W:CGFloat = UIScreen.mainScreen().bounds.size.width
let SCREEN_H:CGFloat = UIScreen.mainScreen().bounds.size.height
let VIEW_H:CGFloat = SCREEN_H - STATUSBAR_H - NAVBAR_H - TABBAR_H
let VIEW_H_NOTAB:CGFloat = SCREEN_H - STATUSBAR_H - NAVBAR_H
