//
//  v6ViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/19.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class v6ViewController: UIViewController {
    var v2 = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        //let label = UILabel()
        let v = UIView()
        v.frame = CGRect(x: 30, y: 100, width: 300, height: 300)
        let img = UIImageView()
        img.frame = v.frame
        img.image = UIImage.init(named:"bb")
        v.addSubview(img)
        view.addSubview(v)
        img.layer.cornerRadius = img.frame.width / 2.0
        img.layer.borderWidth = 4
        img.layer.borderColor = UIColor.red.cgColor
        img.layer.masksToBounds = true
        
        
        
        //抖动动画
        let v1 = UIView()
        v1.frame = CGRect(x: 100, y: 500, width: 300, height: 300)
        v1.backgroundColor = UIColor.blue
        view.addSubview(v1)
        v2 = v1
      
        
//        网络请求
        //1.获取url地址
        let url : URL! = URL(string: "https://www.baidu.com")
        //2.创建请求对象
        let urlreq : URLRequest = URLRequest(url: url)
        //3.创建一个绘画对象
        let session = URLSession.shared
        //4.创建一个任务
        let dataTask = session.dataTask(with: urlreq) { (data:Data?, response:URLResponse?, error:Error?) in
            if error != nil {
                print(error as Any)
            }else{
                let jsonStr = String(data:data!,encoding:String.Encoding.utf8)
                print(jsonStr as Any)
            }
        }
        dataTask.resume()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
