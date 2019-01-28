

enum colorstatus {
    case red
    case blue
    case yellow
    static let allValues = [red, blue, yellow]
}

    private var name:String?


 var viewcolor: colorstatus = .red

class DemoViewController : UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    var textfield:UITextField?
    var pickerView:UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView = UIPickerView()
        //将dataSource设置成自己
        pickerView.dataSource = self
        //将delegate设置成自己
        pickerView.delegate = self
        //设置选择框的默认值
        pickerView.selectRow(1,inComponent:0,animated:true)
        pickerView.selectRow(2,inComponent:1,animated:true)
        pickerView.selectRow(3,inComponent:2,animated:true)
        self.view.addSubview(pickerView)

        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        let button = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))
        button.center = self.view.center
        button.backgroundColor = UIColor.blue
        button.setTitle("获取信息",for:.normal)
        button.addTarget(self, action:#selector(DemoViewController.getPickerViewValue),
                         for: .touchUpInside)
        self.view.addSubview(button)


        self.view.backgroundColor = UIColor.white
//        let _:UIButton = UIButton(type: UIButtonType.system)
//        button.frame = CGRect(x: 100, y: 0, width: 100, height: 40)
//        button.backgroundColor = UIColor.cyan
//        button.setTitle("点击", for: UIControlState.normal)
//        button.addTarget(self, action: #selector(clickbutton), for: UIControlEvents.touchUpInside)
//
//        self.view.addSubview(button)
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

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return 9
    }

    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return String(row)+"-"+String(component)
    }

    //触摸按钮时，获得被选中的索引
    @objc func getPickerViewValue(){
        let message = String(pickerView.selectedRow(inComponent: 0)) + "-"
            + String(pickerView!.selectedRow(inComponent: 1)) + "-"
            + String(pickerView.selectedRow(inComponent: 2))
        let alertController = UIAlertController(title: "被选中的索引为",
                                                message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension DemoViewController: UITextFieldDelegate{
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
