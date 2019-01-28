//
//  v5ViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/19.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class v5ViewController: UIViewController {
    var label1 : UILabel?
    var v00 : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.white
        loaduiview()
        
        
        // Do any additional setup after loading the view.
    }
    @objc func tapClick(){
        v00?.backgroundColor = UIColor.red
    }
    func loaduiview(){
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor.darkGray
        scroll.frame = self.view.frame
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        let v4 = UIView()
        v1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        v2.frame = CGRect(x: 1*self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        v3.frame = CGRect(x: 2*self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        v4.frame = CGRect(x: 3*self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        v1.backgroundColor = UIColor.red
        v2.backgroundColor = UIColor.blue
        v3.backgroundColor = UIColor.gray
        v4.backgroundColor = UIColor.green
        scroll.contentSize = CGSize(width: 4*view.frame.size.width, height: view.frame.size.height)
        scroll.addSubview(v1)
        scroll.addSubview(v2)
        scroll.addSubview(v3)
        scroll.addSubview(v4)
        view.addSubview(scroll)
        scroll.isPagingEnabled = true
        //设置代理
        scroll.delegate = self
        //单击手势
        let label = UILabel()
        label.frame = CGRect(x: 80, y: 90, width: 300, height: 50)
        label.text = "单机手势"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.isUserInteractionEnabled = true
        v2.addSubview(label)
        v00 = v2
        label1 = label
        
        let tapGesture = UITapGestureRecognizer.init()
        tapGesture.addTarget(self, action: #selector(tapClick))
        label.addGestureRecognizer(tapGesture)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension v5ViewController:UIScrollViewDelegate{
    //在scroll滚动时调用
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView)
    }
}
