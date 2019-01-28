import UIKit
import WMPageController
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //var items:[String]!
    //var tableView:UITableView?

    // 顶部刷新
    //let header = MJRefreshNormalHeader()
//    底部加载
    //let footer = MJRefreshAutoNormalFooter()
    override func loadView() {
        super.loadView()
    }
    //定义可重用表示
    //static let cellID:String? = "cellID"
    var dataArr:Array<Goods>?
    override func viewDidLoad() {
        super.viewDidLoad()
        let goods1 = Goods()
        goods1.name = "uitableview"
        
        let goods2 = Goods()
        goods2.name = "wmpagecontroller"
       
        let goods3 = Goods()
        goods3.name = "uicollectionview"
        let goods4 = Goods()
        goods4.name = "app导航"
        
        let goods5 = Goods()
        goods5.name = "代理"
        
        let goods6 = Goods()
        goods6.name = "uiDemo"
       
        dataArr = [goods1,goods2,goods3,goods4,goods5,goods6]
        let tableView = UITableView(frame:self.view.bounds,style:.plain)
        tableView.tableFooterView =  UIView.init(frame: CGRect.zero)
        self.view.addSubview(tableView)
        tableView.register(NSClassFromString("GoodsTableViewCell"), forCellReuseIdentifier: "goodsCell")
        tableView.delegate = self
        tableView.dataSource = self



    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let v2 = v2ViewController()
        self.navigationController?.pushViewController(v2, animated: true)
    }

    //在本例中，只有一个分区

    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataArr?.count ?? 9)
        return dataArr!.count
    }

    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let cell = GoodsTableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "goodsCell")
            cell.setValueForCell(model: dataArr![indexPath.row])
            return cell


    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
//        let message = "是第\(indexPath)个"
        if indexPath.row == 0 {
            let vc = HistoryRecordViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        } else if indexPath.row == 1 {
            let vc = v2ViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        } else if indexPath.row == 2 {
            let vc = v7ViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        } else if indexPath.row == 3 {
            let vc = MainViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        } else if indexPath.row == 4 {
            let vc = DelegateViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if indexPath.row == 5 {
            let vc = DemoViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        }
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
