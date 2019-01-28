//
//  DelegateViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2019/1/28.
//  Copyright © 2019年 will-design-1. All rights reserved.
//

import UIKit




class DelegateViewController: UIViewController , CustomViewDelegae {
    
    var name:String?
    var cv:CustomView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        configViews()
        
    }
    
    func configViews() {
        
        self.title = "首页"
        
        self.view.backgroundColor = UIColor.white
        
        setupData()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension DelegateViewController {
    
    func setupData(){
        self.cv = CustomView.init(delegate: self)
        self.cv!.frame = CGRect(x: 10, y: 10, width: 300, height: 500)
        self.cv!.backgroundColor = UIColor.yellow
        self.view.addSubview(self.cv!)
        
        
    }
    
    @objc func clickAtIndex(index: NSInteger) {
        
        if index == 1 {
            let vc = v5ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            print("click two")
        }
        
    }
}
