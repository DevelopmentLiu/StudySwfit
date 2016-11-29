//
//  Pesron.swift
//  StudySwfit
//
//  Created by jyLiu on 2016/11/28.
//  Copyright © 2016年 JY_L. All rights reserved.
//

import UIKit
//创建构造函数
//1、声明变量
//2、为变量开辟内存空间
//3、为变量赋值
class Pesron: NSObject {
    var name:String
    override init() {
        name = "My name is Allen"
        print(name)
        super.init()
    }
    
}
