//
//  trainViewController.swift
//  trains
//
//  Created by will-design-1 on 2018/10/24.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class trainViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
   
    
    var coview:UICollectionView?
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.height
    var dataArr:Array<train>?
    let header = MJRefreshNormalHeader()
    //    底部加载
    let footer = MJRefreshAutoNormalFooter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "瀑布流"
        view.backgroundColor = UIColor.red
        initCoView()
       
        // Do any additional setup after loading the view.
    }
    func initCoView(){
        let layout =  UICollectionViewFlowLayout.init()
        coview = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        coview!.register(trainViewControllercellCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        coview?.delegate = self
        coview?.dataSource = self
        layout.itemSize = CGSize(width: (width/3)-5, height: 120)
        layout.minimumInteritemSpacing = 2
        self.view.addSubview(coview!)
        
        self.header.setTitle("刷新了",for:.idle)
         self.header.setTitle("刷新了",for:.pulling)
         self.header.setTitle("刷新了",for:.refreshing)
        self.header.stateLabel.textColor = UIColor.red
        self.header.lastUpdatedTimeLabel.isHidden = true
        self.header.setRefreshingTarget(self, refreshingAction: #selector(ViewController.headerRefresh))
        self.coview?.mj_header = header
        
        self.footer.setRefreshingTarget(self, refreshingAction: #selector(ViewController.footerLoad))
        //是否自动加载（默认为true，即表格滑到底部就自动加载）
        self.footer.isAutomaticallyRefresh = false
        
        self.coview?.mj_footer = footer
        getData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (dataArr?.count)!
        return 90
    }
    @objc func headerRefresh(){
        print("下拉刷新.")
        sleep(1)
         coview?.mj_header.endRefreshing()
        
    }
    @objc func footerLoad() {
        print("底部加载")
       
        sleep(2)
        //生成并添加数据
        coview?.mj_footer.endRefreshing()
        
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! trainViewControllercellCollectionViewCell
        
        cell.backgroundColor = UIColor.white
          cell.ValueForCell(model: dataArr![indexPath.section])
//        cell.title.text =

    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section)
    }
    
    func getData(){
        let redpack3 = train()
        redpack3.image = "你好"
    
        //        print(History1)
        let redpack4 = train()
        redpack4.image = "奖金23元"
        dataArr=[redpack3,redpack4]
//        print(dataArr)
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
