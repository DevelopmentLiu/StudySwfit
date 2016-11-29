//
//  Student.swift
//  StudySwfit
//
//  Created by jyLiu on 2016/11/28.
//  Copyright © 2016年 JY_L. All rights reserved.
//

import UIKit

class Student: Pesron {
    var names: String
    //override  重写
   override init() {
        names = "Yes,I like you"
      print(names)
       super.init()
    }
}
