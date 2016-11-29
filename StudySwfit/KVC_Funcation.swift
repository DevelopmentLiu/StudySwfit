//
//  KVC_Funcation.swift
//  StudySwfit
//
//  Created by jyLiu on 2016/11/28.
//  Copyright © 2016年 JY_L. All rights reserved.
//

import UIKit
//构建KVC函数
class KVC_Funcation: NSObject {
    //创建变量为可选值
    var name:String?
    //创建变量为数值类型时，需要对齐赋值，否则无法调用
    var age :Int = 0
    //重载构造函数，使用字典为本类设置初始值
    init(dics:[String: AnyObject]) {
        super.init()
        setValuesForKeys(dics)
    }
    
}
