//
//  v4ViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/19.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

protocol LogManagerDelegate {
    func writeLog()
}

//用户登录类
class UserController {
    var delegate : LogManagerDelegate?
    
    func login() {
        //查看是否有委托，然后调用它
        delegate?.writeLog()
    }
}

//日志管理类
class SqliteLogManager : LogManagerDelegate {
    func writeLog() {
        print("将日志记录到sqlite数据库中")
    }
}


//使用


class v4ViewController: UIViewController{
   
    var stepper:UIStepper!
    var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let userController = UserController()
        userController.login()
        
        let sqliteLogManager = SqliteLogManager()
        userController.delegate = sqliteLogManager
        userController.login() 
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        label.text = "第一页"
        
        //文本输入款
//        let textfield = UITextField()
//        textfield.frame = CGRect(x: view.frame.size.width*0.2, y: view.frame.size.height*0.3, width: 200, height: 60)
//        textfield.borderStyle = .bezel
//        textfield.textColor = UIColor.black
//        textfield.delegate = self
        
        //点击按钮
        let btn = UIButton()
        btn.frame = CGRect(x: 20, y: 100, width: 200, height: 60)
        btn.setTitle("发送给v3", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
        view.addSubview(label)
//        view.addSubview(textfield)
        view.addSubview(btn)
        let first = "登录即表示已阅读并接受"
        let second = "《使用协议》"
        let title = first + second
        let string = NSMutableAttributedString(string: title)
        print("-----------------------------------------")
        print(view.frame)
        string.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], range: NSMakeRange(0, title.count))
        string.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], range: NSMakeRange(0, first.count))
        string.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], range: NSMakeRange(first.count, second.count))
        btn.setAttributedTitle(string, for: .normal)
        
        let uiview = UIView(frame: CGRect(x: 0, y: 300, width: 200, height: 200))
        uiview.backgroundColor = UIColor.blue
//        view.addSubview(uiview)
        UIView.animate(withDuration: 3, animations: {
//            uiview.setAnimationRepeatCount(5)
            uiview.center.x -= 50
            })
        shareCouse()
        
        let b = { (parm : Int) -> (Int) in
            return parm
        }
        //调用
        b(77)
//        stepper=UIStepper()
//        stepper.center=self.view.center
//        //设置stepper的范围与初始值
//        stepper.maximumValue=10
//        stepper.minimumValue=1
//        stepper.value=5.5
//        //设置每次增减的值
//        stepper.stepValue=0.5
//        //设置stepper可以按住不放来连续更改值
//        stepper.isContinuous=true
//        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
//        stepper.wraps=true
//        stepper.addTarget(self,action:"stepperValueIschanged",
//                          for: UIControlEvents.valueChanged)
//        self.view.addSubview(stepper)
//        label = UILabel(frame:CGRect(x: 19, y: 70, width: 200, height: 100))
//        print(stepper.value)
//        label.text = "当前值为：\(stepper.value)"
//        self.view.addSubview(label)
        let sWidth = UIScreen.main.bounds.width
        print(sWidth)
        
        
    }
    @objc func btnClick()  {
//        let v2 = HistoryRecordViewController()
//        self.navigationController?.pushViewController(v2, animated: true)
       self.name()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func stepperValueIschanged(){
        label.text="当前值为：\(stepper.value)"
    }
    

    func shareCouse () {
        let provide = MoyaProvider<NetworkTarget>()
        provide.request(.playlist(code:"3MtoAlLNaJl1qSSSnUG%2FHuhjnfazCccJPHqBYRwsQac%3D")){Result in
            switch Result {
            case let .success(response):
                let json = JSON(response.data)
                print(json)
            case let .failure(error):
                print("___---------------------")
                print(error)
                
            }
        }
    }
    
    
//    func loadDataWithMoya() -> () {
//        let provide = MoyaProvider<NetworkTarget>()
//        provide.request(.playlist(key:"bf1ab109ce9a9c7442dd1286ba0405ba",title:"%E9%92%A2%E9%93%81%E4%BE%A03")) { Result in
//        
//            switch Result {
//            case let .success(response):
//                //数据解析
//                let json = JSON(response.data)
//                print(json)
//
//            case let .failure(error):
//                print(error)
//            }
//        }
//    }
    internal func name() {
        print("alert")
    }
   

}
extension v4ViewController:UITextFieldDelegate{
    //弹出键盘
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    //点击收缩键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //这个方法是取消第一响应者状态
        textField.resignFirstResponder()
        print(textField.text ?? "")
        return true
    }
    
    //输入款结束编辑的时候调用
    //func textFieldDidEndEditing(_ textField: UITextField) {
       
    //}
    //当文本框出现内容变化时调用
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //let fullStr = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        //print(textField.text)
        return true
    }
    
    //文本款是否可以清除内容
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    //代表输入框已经开始编辑时调用
    //func textFieldDidBeginEditing(_ textField: UITextField) {
        //return true
    //}
}
