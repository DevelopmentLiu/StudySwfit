//
//  UIButton+extension.swift
//  StudySwfit
//
//  Created by jyLiu on 2016/11/28.
//  Copyright © 2016年 JY_L. All rights reserved.
//

import UIKit

//创建关于button的便利构造函数
extension UIButton{
    
    convenience init(frame:CGRect,title:String,color:UIColor = UIColor.blue){
    //实例化当前对象
        self.init(frame:frame)
        //访问属性
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
    }
}
