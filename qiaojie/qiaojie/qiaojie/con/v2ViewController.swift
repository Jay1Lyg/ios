//
//  v3ViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/18.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit
import WMPageController

class v2ViewController: WMPageController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.titles = ["tab1", "tab2"]
        self.viewControllerClasses = [v4ViewController.self, DelegateViewController.self]
        self.showOnNavigationBar = true
        self.postNotification = true  //
        self.bounces = true
        self.titleSizeSelected=13    //选中时的标题尺寸
        self.titleSizeNormal=14      //非选中时的标题尺寸
        self.menuViewStyle = .line    //Menu view 的样式，默认为无下划线
        self.titleColorSelected=UIColor.red    //标题选中时的颜色, 颜色是可动画的.
        self.titleColorNormal=UIColor.black    //标题非选择时的颜色, 颜色是可动画的
        self.menuView?.backgroundColor = UIColor.white //导航栏背景色
        self.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}


