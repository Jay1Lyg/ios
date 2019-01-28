//
//  HistoryRecordTableViewCell.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/26.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class HistoryRecordTableViewCell: UITableViewCell {
    var runtimelab:UILabel?
    var datatimeLeb:UILabel?
    var bonusLab:UILabel?
    var arrowLab:UIImageView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lauoutUI()
    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
        arrowLab?.frame = CGRect(x: self.contentView.frame.size.width-20, y: 41, width: 7.2, height: 7.2)
        datatimeLeb?.frame = CGRect(x: self.contentView.frame.size.width-40, y: 10, width: 30, height: 12)
    }
    func lauoutUI(){
        
        runtimelab = UILabel(frame:CGRect(x:14,y:10,width: 130,height:17))
        self.addSubview(runtimelab!)
        datatimeLeb = UILabel(frame:CGRect(x: self.contentView.frame.size.width,y:10,width: 30,height:12))
        self.addSubview(datatimeLeb!)
        bonusLab = UILabel(frame:CGRect(x:14,y:41,width: 230,height:14))
        self.addSubview(bonusLab!)
        print(self.contentView)
        arrowLab = UIImageView(frame: CGRect(x: self.contentView.frame.size.width, y: 41, width: 7.2, height: 7.2))
        self.addSubview(arrowLab!)
    }
    
    func setValueForCell(model:HistoryRecord){
        self.runtimelab?.text = model.runtime
        self.runtimelab?.textColor = UIColor.black
        self.runtimelab?.font = UIFont.systemFont(ofSize: 17)
        self.datatimeLeb?.text = model.datatime
        self.datatimeLeb?.textColor = UIColor.black
        self.datatimeLeb?.font = UIFont.systemFont(ofSize: 12)
        self.bonusLab?.text = model.bonus
        self.bonusLab?.textColor = UIColor.black
        self.bonusLab?.font = UIFont.systemFont(ofSize: 12)
        self.arrowLab?.image = UIImage(named:model.arrow!)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
