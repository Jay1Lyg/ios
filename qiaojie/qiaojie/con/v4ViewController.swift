//
//  v4ViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/19.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class v4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        label.text = "第一页"
        
        //文本输入款
        let textfield = UITextField()
        textfield.frame = CGRect(x: view.frame.size.width*0.2, y: view.frame.size.height*0.3, width: 200, height: 60)
        textfield.borderStyle = .bezel
        textfield.textColor = UIColor.black
        textfield.delegate = self
        
        //点击按钮
        let btn = UIButton()
        btn.frame = CGRect(x: view.frame.size.width*0.2, y: view.frame.size.height*0.3+100, width: 200, height: 60)
        btn.setTitle("发送给v3", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(textfield)
        view.addSubview(btn)
        
        // Do any additional setup after loading the view.
    }
    @objc func btnClick()  {
        let v2 = HistoryRecordViewController()
        self.navigationController?.pushViewController(v2, animated: true)
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
