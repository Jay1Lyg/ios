//
//  HistoryRecordViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/26.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class HistoryRecordViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    var dataarr:Array<HistoryRecord>?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let History1 = HistoryRecord()
        History1.datatime = "9/21"
        History1.runtime = "54分钟"
        History1.arrow = "bb"
        History1.bonus = "奖金23元"
        print(History1)
        print("nihao")
        let History11 = HistoryRecord()
        History11.datatime = "9/21"
        History11.runtime = "54分钟"
        History11.arrow = "bb"
        History11.bonus = "奖金23元"
        dataarr = [History1,History11]
       
        let tableView = UITableView(frame:CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: view.frame.size.height),style:.plain)
        self.view.addSubview(tableView)
        //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone
        //tableView.separatorStyle = UITableViewCellSeparatorStyle.none

        tableView.register(NSClassFromString("HistoryRecordTableViewCell"), forCellReuseIdentifier: "historyCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataarr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HistoryRecordTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "historyCell")
        cell.setValueForCell(model: dataarr![indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
