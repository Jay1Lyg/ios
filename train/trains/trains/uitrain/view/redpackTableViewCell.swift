//
//  redpackTableViewCell.swift
//  trains
//
//  Created by will-design-1 on 2018/10/23.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class redpackTableViewCell: UITableViewCell {
    var namelabel:UILabel?
    var sexlabel:UILabel?
    var agelabel:UILabel?
    var redpacknumlabel:UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        lauoutUI()
    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
       
    }
    func lauoutUI() {
        namelabel = UILabel(frame: CGRect(x: 14, y: 10, width: 130, height: 17))
        self.addSubview(namelabel!)
        sexlabel = UILabel(frame:CGRect(x: self.contentView.frame.size.width,y:10,width: 30,height:12))
        self.addSubview(sexlabel!)
        agelabel = UILabel(frame:CGRect(x:14,y:41,width: 230,height:14))
        self.addSubview(agelabel!)
        print(self.contentView)
        redpacknumlabel = UILabel(frame: CGRect(x: self.contentView.frame.size.width, y: 41, width: 30, height: 12))
        self.addSubview(redpacknumlabel!)
        
    }
    func setValueForCell(model:redpack){
        self.namelabel?.text = model.name
        self.namelabel?.textColor = UIColor.black
        self.namelabel?.font = UIFont.systemFont(ofSize: 17)
        self.sexlabel?.text = model.sex
        self.sexlabel?.textColor = UIColor.black
        self.sexlabel?.font = UIFont.systemFont(ofSize: 12)
        self.agelabel?.text = model.age
        self.agelabel?.textColor = UIColor.black
        self.agelabel?.font = UIFont.systemFont(ofSize: 12)
        self.redpacknumlabel?.text = model.redbacknum
        self.redpacknumlabel?.textColor = UIColor.black
        self.redpacknumlabel?.font = UIFont.systemFont(ofSize: 12)
        
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
