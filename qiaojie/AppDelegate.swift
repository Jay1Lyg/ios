//
//  AppDelegate.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/17.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //管理应用程序生命周期。 当程序启动的时候调用这个方法。 把要启动的视图控制器写在这个方法里面
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //chaungjian一个视图控制器
        let v1 = ViewController()

        //穿件一个导航控制器
        let nav = NavigationController(rootViewController: v1)
        //创建一个window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        //添加控制器到window
        self.window?.rootViewController = nav
        //显示window
        self.window?.makeKeyAndVisible()
        
        
        //分栏控制器
        //1.初始化
//        let tab = UITabBarController()
//        //2.nadao视图控制器
//        let v4 = ViewController()
//        v4.tabBarItem.image = UIImage.init(named: "goback")
//        let nav1 = UINavigationController(rootViewController: v4)
//        v4.tabBarItem.title = "首页"
//       v4.navigationItem.title = "w微信"
//        let v5 = v5ViewController()
//         let nav2 = UINavigationController(rootViewController: v5)
//        v5.tabBarItem.image = UIImage.init(named: "goback")
//        v5.tabBarItem.title = "发现"
//        v5.navigationItem.title = "发现"
//        let v6 = v6ViewController()
//        let nav3 = UINavigationController(rootViewController: v6)
//        v6.tabBarItem.image = UIImage.init(named: "goback")
//        v6.tabBarItem.title = "通讯录"
//       v6.navigationItem.title = "tongxunlu"
//        
//        let v7 = v7ViewController()
//        let nav4 = UINavigationController(rootViewController: v7)
//        v7.tabBarItem.title = "我的"
//        v7.navigationItem.title = "我的"
//        v7.tabBarItem.image = UIImage.init(named: "goback")
//        //3.把字控制器添加到芬兰控制器
//        tab.viewControllers = [nav1,nav2,nav3,nav4]
//        //4把分栏控制器添加到window
//        self.window?.rootViewController = tab
//        //显示窗口个数
//        self.window?.makeKeyAndVisible()
//        
        
        
        
        return true
    }
    //点击手机home键，从前台退到后台时调用
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    //当点击手机的home，已经进入后台的时候调用这个方法
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    //再打开程序的时候：从后台到前台调用这个方法
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    //当程序彻底退出时调用
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    //当application将要关闭的时候调用
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

