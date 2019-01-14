//import UIKit
//import WMPageController
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    //var items:[String]!
//    //var tableView:UITableView?
//
//    // 顶部刷新
//    //let header = MJRefreshNormalHeader()
////    底部加载
//    //let footer = MJRefreshAutoNormalFooter()
//    override func loadView() {
//        super.loadView()
//    }
//    //定义可重用表示
//    //static let cellID:String? = "cellID"
//    var dataArr:Array<Goods>?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let goods1 = Goods()
//        goods1.name = "西凤酒－华山论剑"
//        goods1.price = "300.00"
//        goods1.desTitle = "西凤酒是中国四大名酒之一，曾荣获过万国博览会金奖。华山论剑西凤酒，中国峰峻品格的首倡者。"
//        goods1.coverIamge = "image"
//        let goods2 = Goods()
//        goods2.name = "西凤酒－华山论剑"
//        goods2.price = "300.00"
//        goods2.desTitle = "西凤酒是中国四大名酒之一，曾荣获过万国博览会金奖。华山论剑西凤酒，中国峰峻品格的首倡者。"
//        goods2.coverIamge = "image"
//        let goods3 = Goods()
//        goods3.name = "西凤酒－华山论剑"
//        goods3.price = "300.00"
//        goods3.desTitle = "西凤酒是中国四大名酒之一，曾荣获过万国博览会金奖。华山论剑西凤酒，中国峰峻品格的首倡者。"
//        goods3.coverIamge = "image"
//        dataArr = [goods1,goods2,goods3]
//        let tableView = UITableView(frame:self.view.bounds,style:.plain)
//        tableView.tableFooterView =  UIView.init(frame: CGRect.zero)
//        self.view.addSubview(tableView)
//        tableView.register(NSClassFromString("GoodsTableViewCell"), forCellReuseIdentifier: "goodsCell")
//        tableView.delegate = self
//        tableView.dataSource = self
//
//
//
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let v2 = v2ViewController()
//        self.navigationController?.pushViewController(v2, animated: true)
//    }
//
//    //在本例中，只有一个分区
//
//    //返回表格行数（也就是返回控件数）
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(dataArr?.count ?? 9)
//        return dataArr!.count
//    }
//
//    //创建各单元显示内容(创建参数indexPath指定的单元）
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
//        -> UITableViewCell {
//            //为了提供表格显示性能，已创建完成的单元需重复使用
//            let cell = GoodsTableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "goodsCell")
//            cell.setValueForCell(model: dataArr![indexPath.row])
//            return cell
//
//
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
////        let message = "是第\(indexPath)个"
//        let v2 = v2ViewController()
//        self.navigationController?.pushViewController(v2, animated: false)
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}
enum colorstatus {
    case red
    case blue
    case yellow
    
    
    static let allValues = [red, blue, yellow]
}

    private var name:String?


 var viewcolor: colorstatus = .red

class ViewController : UIViewController{
    var textfield:UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let button:UIButton = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 100, y: 0, width: 100, height: 40)
        button.backgroundColor = UIColor.cyan
        button.setTitle("点击", for: UIControlState.normal)
        button.addTarget(self, action: #selector(clickbutton), for: UIControlEvents.touchUpInside)
       
        self.view.addSubview(button)
        print(name)
        text(y: 200)
//        text(y: 300)
        
        let imgView = UIImageView(image: UIImage(named: "bb"))
        imgView.frame = CGRect(x: 10, y: 350, width: 200, height: 200)
        view.addSubview(imgView)

        let textview = UITextView(frame: CGRect(x: 300, y: 300, width: 200, height: 300))
        textview.layer.borderWidth = 1
        textview.layer.borderColor = UIColor.red.cgColor
        textview.backgroundColor = UIColor.clear
        textview.isEditable = true
        textview.selectedRange = NSRange(location: 0, length: Int.max)
        view.addSubview(textview)


        let swich = UISwitch(frame: CGRect(x: 10, y: 20, width: 50, height: 40))
        swich.center = CGPoint(x: 100, y: 100)
        swich.isOn = true
        view.addSubview(swich)
        swich.addTarget(self, action: #selector(swichclick), for: .valueChanged)

        //分段选择器
        let items = ["hello" as AnyObject,"world" as AnyObject]
        let semmentcol = UISegmentedControl(items: items)
        semmentcol.center = self.view.center
        semmentcol.selectedSegmentIndex = 1
        view.addSubview(semmentcol)
//
//
//        //滑块
        let slider = UISlider(frame: CGRect(x: 50, y: 500, width: 200, height: 20))
        slider.center = self.view.center
        slider.minimumValue = 0
        slider.maximumValue = 2
        slider.value = 0.5
        slider.setValue(0.8, animated: true)
        view.addSubview(slider)
        print(UIScreen())
        
        let swip = UISwipeGestureRecognizer(target: self, action: #selector(swiper))
        swip.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swip)
        
        
        //点击其他地方收回键盘
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(handletap)))
    }
    @objc func handletap(){
        textfield?.resignFirstResponder()
        print(textfield?.text ?? "")
        name = textfield?.text
    }
    @objc func clickbutton(){
        print(name as Any)
        switch viewcolor{
        case .red:
            view.backgroundColor = UIColor.red
        case .blue:
            view.backgroundColor = UIColor.blue
        case .yellow:
            view.backgroundColor = UIColor.yellow
        }
        // 当前状态在枚举数组中的 index
        let currentIndex = colorstatus.allValues.index(of: viewcolor)
        
        // 枚举数组中最后一个元素的 index
        let option = colorstatus.allValues.last!
        let lastIndex = colorstatus.allValues.index(of: option)
        
      if currentIndex! < lastIndex! {
            viewcolor = colorstatus.allValues[currentIndex! + 1]
        } else {
            viewcolor = colorstatus.allValues.first!
        }
    
//        self.view.backgroundColor = UIColor.red
    }
    @objc func swichclick(){

    }
    @objc func swiper(){
    print("开始滑动")
    }
    func text(y:Float){
        textfield = UITextField(frame: CGRect(x: 100, y: Int(y), width: 100, height: 40))
        textfield?.borderStyle = UITextBorderStyle.roundedRect
        textfield?.placeholder = "请输入"
        textfield?.backgroundColor = UIColor.white
        textfield?.adjustsFontSizeToFitWidth = true
        textfield?.minimumFontSize = 12
        textfield?.textAlignment = .left
        textfield?.clearButtonMode = UITextFieldViewMode.unlessEditing
        textfield?.keyboardType = UIKeyboardType.default
        textfield?.returnKeyType = .default
        //textfield.becomeFirstResponder()
        
        textfield?.delegate = self
        self.view.addSubview((textfield)!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITextFieldDelegate{
    //开始输入时调用
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
         print("开始输入")
        return true
    }
    //输入结束时调用
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //这个方法是取消第一响应者状态
        textField.resignFirstResponder()
        
        print(textField.text ?? "")
        name = textField.text
        return true
    }
    //
    
}
