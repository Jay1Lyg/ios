//
//  v3ViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/18.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class v3ViewController: UIViewController {
    //定义可重用表示
    static let cellID: String = "cellID"
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    //    底部加载
    let footer = MJRefreshAutoNormalFooter()
    var uiview:UIView?
    var tabView:UITableView?
    var uiviewTop:UIView?
    var btnTopLeft:UIButton?
    var labelTopCenter:UILabel?
    var btnTopRight:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        print(view.bounds)
        print(UIScreen.screens)
        self.navigationItem.title = "历史记录"
        self.uiview = UIView(frame: CGRect(x: 10, y: 0, width: view.frame.size.width-20, height: view.frame.size.height))
        //self.uiview?.backgroundColor = UIColor.blue
        self.uiviewTop = UIView(frame: CGRect(x: 0, y: 60, width: view.frame.size.width-20, height: 60))
        self.uiviewTop?.backgroundColor = UIColor.red
        self.btnTopLeft = UIButton(frame: CGRect(x: 14, y: 21, width: 18, height: 18))
       //self.btnTopLeft?.setTitle("左", for: .normal)
        self.btnTopLeft?.setImage(UIImage(named: "bb"), for: .normal)
        self.btnTopLeft?.setTitleColor(UIColor.black, for: .normal)
        self.uiviewTop?.addSubview(btnTopLeft!)
        
        
        self.btnTopRight = UIButton(frame: CGRect(x: view.frame.size.width-52, y: 21, width: 18, height: 18))
        //self.btnTopRight?.setTitle("右", for: .normal)
        self.btnTopRight?.setImage(UIImage(named: "bb"), for: .normal)
        self.btnTopRight?.setTitleColor(UIColor.black, for: .normal)
        self.uiviewTop?.addSubview(btnTopRight!)
        
        self.labelTopCenter = UILabel(frame: CGRect(x: 90, y: 5, width: 150, height: 50))
        self.labelTopCenter?.text = "2018年9月"
        
        self.labelTopCenter?.textColor = UIColor.black
        self.labelTopCenter?.textAlignment = NSTextAlignment.right
        self.uiviewTop?.addSubview(labelTopCenter!)
//        self.uiview?.addSubview(uiviewTop!)
        //1.创建表格视图
        self.tabView = UITableView(frame: CGRect(x: 0, y: 120, width: view.frame.size.width-20, height: view.frame.size.height-120), style: .plain)
        self.tabView?.estimatedRowHeight = 0
        self.tabView?.estimatedSectionHeaderHeight = 0
        self.tabView?.sectionHeaderHeight = 0
        
        //把视图添加到控制器
        
        self.uiview?.addSubview(self.tabView!)
        self.view.addSubview(uiview!)
        //设置表格视图数据源
       
        self.tabView!.dataSource = self
        //设置表格视图代理
        self.tabView?.delegate = self
        //注册可重用的cell
        //self.tabView?.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.cellID!)
        
        
        self.header.setRefreshingTarget(self, refreshingAction: #selector(v3ViewController.headerRefresh))
        self.tabView?.mj_header = header

        //底部加载
        self.footer.setRefreshingTarget(self, refreshingAction: #selector(v3ViewController.footerLoad))
        //是否自动加载（默认为true，即表格滑到底部就自动加载）
        self.footer.isAutomaticallyRefresh = false
        self.tabView?.mj_footer = footer
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        let vc = navigationController?.viewControllers[0] as!ViewController
//        _ = self.navigationController?.popToViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func headerRefresh(){
        print("下拉刷新.")
        sleep(2)
        //重现生成数据  refreshItemData()
        //重现加载表格数据
        tabView?.mj_header.endRefreshing()
        //结束刷新
        
       
    }
    @objc func footerLoad() {
        print("底部加载")
        sleep(2)
        //生成并添加数据
       
    }
    


}
extension v3ViewController: UITableViewDataSource {
    //一共有多少cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    //每一个cell的数据
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = String.init(format:"tabView%ld",(indexPath.row))
        cell.detailTextLabel?.text = "奖金12元"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        cell.detailTextLabel?.textColor = UIColor.black
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        //cell.imageView?.image = UIImage.init(named:"bb")
        let uiview = UIView(frame: CGRect(x: view.frame.size.width-80, y: 0, width: 60, height: 60))
        let rightlabel = UILabel(frame: CGRect(x: 0, y: 10, width: 40, height: 20))
        rightlabel.text = "9/29"
        rightlabel.font = UIFont.systemFont(ofSize: 12)
        rightlabel.textColor = UIColor.black;
//        let arrow = UIImage(frame: CGRect(x: 30, y: 30, width: 20, height: 20))
//        arrow.textColor = UIColor.gray
//        arrow.text = ">"
        let img = UIImageView()
        img.frame = CGRect(x: 30, y: 40, width: 7.2, height: 7.2)
        img.image = UIImage.init(named:"bb")
          uiview.addSubview(img)
        uiview.addSubview(rightlabel)
      
        //cell.accessoryView = rightlabel
        //cell.accessoryView = arrow
        cell.addSubview(uiview)
        //cell.addSubview(arrow)
      
        print(cell)
        return cell
    }
    //有多少cell
    
    
}

//表格视图代理方法
extension v3ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let message = "是第\(indexPath)个"
        showMsgbox(_message:message)
    }
    func showMsgbox(_message: String, _title: String = "提示"){
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.alert)
        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true, completion: nil)
        
    }
}
