import UIKit

@objc protocol CustomViewDelegae {
    func clickAtIndex(index:NSInteger)
}

class CustomView: UIView {
    
    weak var delegate: CustomViewDelegae?
    var button1:UIButton?
    var button2:UIButton?
    
    
    init(delegate: CustomViewDelegae) {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        self.delegate = delegate
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.button1 = UIButton.init(type: .custom)
        self.button1?.backgroundColor = UIColor.red
        self.button1?.frame = CGRect(x: 10, y: 10, width: 100, height: 40)
        self.button1?.tag = 1
        self.button1?.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.addSubview(self.button1!)
        
        
        self.button2 = UIButton.init(type: .custom)
        self.button2?.backgroundColor = UIColor.blue
        self.button2?.frame = CGRect(x: 10, y: 100, width: 100, height: 40)
        self.button2?.tag = 2
        self.button2?.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.addSubview(self.button2!)
        
        
    }
    
    @objc func buttonClick(sender:UIButton){
        
        clickAtIndex(index: sender.tag)
    }
    
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}

extension CustomView {
    
    func clickAtIndex(index:NSInteger) {
        
        delegate?.clickAtIndex(index: index)
        
        print("you have clicked:",index)
        
    }
}
