//
//  v7ViewController.swift
//  qiaojie
//
//  Created by will-design-1 on 2018/9/19.
//  Copyright © 2018年 will-design-1. All rights reserved.
//

import UIKit

class v7ViewController: UIViewController {
   static let cellID = "cellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //创建一个布局
        let layout = UICollectionViewFlowLayout.init()
        //设置item 大小
        layout.itemSize = CGSize(width: 120, height: 120)
        
        //设置item艰巨
        layout.minimumInteritemSpacing = 2
        //设置每一行间距
        layout.minimumLineSpacing = 5
        //创建collection表格视图
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        //设置collectionview表格视图的数据源
        collection.dataSource = self
        //注册collectionview
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: v7ViewController.cellID)
        view.addSubview(collection)
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
extension v7ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: v7ViewController.cellID, for: indexPath)
        cell.backgroundColor = UIColor.red
        let img = UIImageView(image: UIImage.init(named:"bb"))
        img.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        cell.addSubview(img)
        return cell
    }
    
    
}
