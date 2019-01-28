//
//  MainViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2019/1/16.
//  Copyright © 2019年 will-design-1. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.yellow
        tabBar.backgroundColor = UIColor.white
        
        
        self.addChildVC(childVC: v2ViewController(), childtitle: "First", imageName: "weibo", selectedImageName: "QQ")
        self.addChildVC(childVC: v3ViewController(), childtitle: "Second", imageName: "weibo", selectedImageName: "QQ")

        self.addChildVC(childVC: v5ViewController(), childtitle: "Third", imageName: "weibo", selectedImageName: "QQ")
        // Do any additional setup after loading the view.
    }
    
    private func addChildVC(childVC: UIViewController,childtitle: String,imageName:String,selectedImageName:String){
        let navigation = NavigationController(rootViewController: childVC)
//        navigation.navigationBar.tintColor = UIColor.black //item 字体颜色
//        navigation.navigationBar.barTintColor = UIColor.yellow //背景颜色
//        let dict:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
//        navigation.navigationBar.titleTextAttributes = dict as! [String : AnyObject]
        childVC.title = childtitle
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(navigation)
    }
    

}
