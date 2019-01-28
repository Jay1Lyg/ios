//
//  NavigationController.swift
//  qiaojie
//
//  Created by will-design-1 on 2019/1/16.
//  Copyright © 2019年 will-design-1. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //导航栏背景色
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        //导航标题wenzi
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor:UIColor.red,
            NSAttributedStringKey.font:UIFont.systemFont(ofSize:18)
        ]
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
