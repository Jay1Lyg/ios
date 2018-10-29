//
//  trainViewControllercellCollectionViewCell.swift
//  trains
//
//  Created by will-design-1 on 2018/10/24.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class trainViewControllercellCollectionViewCell: UICollectionViewCell {
    var title:UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
        title = UILabel(frame: CGRect(x: 20, y: 20, width: 100, height: 30))
        self.addSubview(title!)
    }
    func ValueForCell(model:train){
        self.title?.text = model.image
        self.title?.textColor = UIColor.black
    }
    
}
