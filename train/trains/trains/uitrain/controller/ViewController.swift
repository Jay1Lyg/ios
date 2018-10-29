//
//  ViewController.swift
//  trains
//
//  Created by will-design-1 on 2018/10/23.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    var uilabel:UILabel?
    var uiview:UIView?
    var tableview:UITableView?
    var data:Array<redpack>?
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    //    底部加载
    let footer = MJRefreshAutoNormalFooter()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "关于"
        //let RootNavigatonVc = UINavigationController.init(rootViewController:ViewController.init())
//        RootNavigatonVc.delegate = self as? UINavigationControllerDelegate;
        /**
         设置主窗口
         */
         self.tableview = UITableView(frame:CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: view.frame.size.height),style:.plain)
        view.backgroundColor = UIColor.gray
        self.view.addSubview(tableview!)
        self.tableview?.rowHeight = 60
//        self.tableview?.rowHeight = UITableViewAutomaticDimension
        self.tableview?.tableFooterView = UIView()
//        self.tableview?.separatorStyle = UITableViewCellSeparatorStyle.singleLineEtched
    
        self.tableview?.register(NSClassFromString("redpackTableViewCell"), forCellReuseIdentifier: "redpackcell")
        self.tableview!.delegate = self
        self.tableview!.dataSource = self
        self.header.setRefreshingTarget(self, refreshingAction: #selector(ViewController.headerRefresh))
        self.tableview?.mj_header = header
        refreshItemData()
        //底部加载
        self.footer.setRefreshingTarget(self, refreshingAction: #selector(ViewController.footerLoad))
        //是否自动加载（默认为true，即表格滑到底部就自动加载）
        self.footer.isAutomaticallyRefresh = false
        self.tableview?.mj_footer = footer
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func headerRefresh(){
        print("下拉刷新.")
        sleep(2)
//        view.backgroundColor = UIColor.red
        //重现加载表格数据
        tableview?.mj_header.endRefreshing()
        //结束刷新
        
        
    }
    @objc func footerLoad() {
        print("底部加载")
        refreshItemDatas()
        sleep(2)
        //生成并添加数据
        
        
        tableview?.mj_footer.endRefreshing()
        
    }
    func refreshItemData(){
        print("你还")
        let redpack3 = redpack()
        redpack3.name = "你好"
        redpack3.age = "54分钟"
        redpack3.sex = "bb"
        redpack3.redbacknum = "奖金23元"
        //        print(History1)
        let redpack4 = redpack()
        redpack4.name = "988"
        redpack4.age = "54分钟"
        redpack4.sex = "bb"
        redpack4.redbacknum = "奖金23元"
        data=[redpack3,redpack4]
        print(data!)
//        data?.append(redpack3)
    }
    func refreshItemDatas(){
//        print("你还")
        let redpack3 = redpack()
        redpack3.name = "你好"
        redpack3.age = "54分钟"
        redpack3.sex = "bb"
        redpack3.redbacknum = "奖金23元"
        //        print(History1)
        let redpack4 = redpack()
        redpack4.name = "988"
        redpack4.age = "54分钟"
        redpack4.sex = "bb"
        redpack4.redbacknum = "奖金23元"
//        data=[redpack3,redpack4]
        data=[]
                data=[redpack4,redpack3]
        tableview!.reloadData()
    }

}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = redpackTableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "redpackcell")
        cell.setValueForCell(model: data![indexPath.row])
        return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> Bool {
            return true
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let trainView = trainViewController()
        print(self.navigationController)
       self.navigationController?.pushViewController(trainView, animated: true)
        
        //self.present(trainView, animated: true, completion: nil)
        //self.present(trainView, animated: true, completion: nil)
//        let message = "是第\(indexPath)个"
        
//        showMsgbox(_message:message)
    }
    func showMsgbox(_message: String, _title: String = "提示"){
        //
        //        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.alert)
        //        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
        //        alert.addAction(btnOK)
        //        self.present(alert, animated: true, completion: nil)
        let alertController = UIAlertController(title: "显示数据", message: _message,
                                                preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        //let deleteAction = UIAlertAction(title: "删除", style: .destructive, handler: nil)
        let archiveAction = UIAlertAction(title: "保存", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        //alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
