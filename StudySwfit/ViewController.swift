//
//  ViewController.swift
//  StudySwfit
//
//  Created by jyLiu on 2016/10/27.
//  Copyright © 2016年 JY_L. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建UIView
        let v = UIView(frame:CGRect.init(x: 0, y: 0, width: 100, height: 100))
        v.backgroundColor = UIColor.red;
       self.view .addSubview(v)
        //利用构造函数创建UIButton
        let btn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 50, height: 30),
                           title: "clickMe",
                           color: UIColor.orange)
        btn.center = v.center
        btn.addTarget(self, action: #selector(onClickMe), for: .touchUpInside)
        v .addSubview(btn)
        //创建图片
        let image = UIImageView.init(image:#imageLiteral(resourceName: "头像"))
        image.center = self.view.center
        self.view .addSubview(image)
        
        //创建TableView
        let screenWidth = UIScreen.main.bounds.size.width        /// 屏幕宽
        let screenHeight = UIScreen.main.bounds.size.height       /// 屏幕高
        let tableView = UITableView(frame: CGRect.init(x: 0, y: 45, width: screenWidth, height: screenHeight), style: UITableViewStyle.plain);
        tableView.delegate = self;
        tableView.dataSource = self;
//        self.view .addSubview(tableView)
        
        //调取函数
//        demo()
        aboutSwitch(number:"Hello")
//        aboutErgodiCation()
        
        //获取构造函数.不用import.直接调用就行
//        let p = Pesron()
        //构造函数继承时，子类会继承父类的对象。直接调用
//        let s = Student()
//        print(s.names + s.name)
        
        //调用重载构造函数
        let f = KVC_Funcation(dics:["name":"隔壁老王" as AnyObject,"age":"18" as AnyObject])
        print("\(f.name) \(f.age)")
        
        requestNetWork()
    }
    
    //MARK:调取button方法
    func onClickMe() -> () {
        //打印方法
        print(#function)
    }
    //MARK:设置标注的方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "THISCELL")
        if cell == nil{
            cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "THISCELL" )
        }
        cell?.textLabel?.text = "做测试数据用"
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: Swfit基础学习
    func demo(){
        //对于值的输出需要强转类型，不同类型，不能运行
        let x = 10
        let y = 5.5
        print(x + Int(y))
        
        //？替换的是Optional 的是简易的写法。Optional为可选值，创建的常量中可能为nil,可能也有值
        let x1:Int? = 10
        //let x1:Int? = nil 这是错误的写法，不能赋值为空
        //相对应的，在创建了Optional。就必须加上！。表示解包，拿到包里的数值。
        print(x1!)
        
        //三目运算符
        //Will never be executed 意思：永远不会执行这一句 这也说明了 Swfit会对语法本身自动做检测
        let a = 100
        //下面的也可以替换为  a > 10 ? print("YES"):()    ‘()’表示的是空执行
        a > 10 ? print("YES"):print("NO")
        print(a)
    }
    
    
    //MARK:if let/var 值连用语法，目的：判断值值是否为空。不需要再解包
    func aboutIfLetVar()
    {
        let name : String? = "我叫Allen"
        let age  : Int?    = 1
        
        if let allenName = name,
            let allenAge = age
        {
            print(allenName + String(allenAge))
        }
        else
        {
            print("allen的名字或者年龄为空！")
        }
    }
    //MARK:guard let 连用语法，
    //目的：减少判断值时产生的逻辑分支。先执行为空的判断。后面再执行有值的语句
    func aboutGuardLet()
    {
        let name : String? = "我叫Allen"
        let age  : Int?    = nil
        
        guard let oName = name,
            let oAge = age else {
                print("年龄或名字为空！")
                return;
        }
        print(oName + String(oAge))
    }
    
    //MARK:switch的使用。对于判断字符窜，它可以进行多个字符串的连接进行判断
    func aboutSwitch(number:String)
    {
        switch number {
        case "Hello","Model":
            print("执行代码")
        default:
            print("没有执行")
        }
    }
    
    //MARK:for循环的使用。替代了C语言最基础的循环格式
    //说明:对于for判断值的创建，中间不能有任何空格
    func aboutFor()
    {
        //判断值范围 0-4
        for i in 0..<5 {
            print(i)
        }
        //判断值范围 0-5
        for k in 0...5 {
            print(k)
        }
        //reversed 进行反序输出
        for j in (0..<5).reversed()
        {
            print(j)
        }
        
    }
    
    
    //MARK:字符串字符长度
    func aboutStringCout()
    {
        let font = "Hello World!"
        print(font.characters.count)
        
        //拼接字符串
        let word = "I have a pen"
        //对于可选值，需要 ？？
        let title:String? = "Allen"
        
        let compare = "\(font),\(word),\(title ?? "")"
        
        print(compare)
    }

    //MARK:获取字符串子串
    func abloutStringChild()
    {
        let s = "Hello evrybody,My name is Allen"
        //转换为NSString。 as表示中转
        let s1 = s as NSString
        //NSMakeRange(xx,xx) 表示从下标第几位开始，总共获取多少个值
        let s2 = s1.substring(with: NSMakeRange(2, 10))
        print(s2)
    }
    
    //MARK:数组遍历
    func aboutArray()
    {
        //通过下标遍历
        let array = ["赫赫","赤赤","嘟嘟","花花"]
        for i in 0..<array.count {
            print(i)
        }
        
        //直接遍历元素,String 字符类型也一样
        let arrays = [1,2,3,4,5,6,7,8,9]
        for k in arrays {
            print(k)
        }
        //反序遍历元素
        for j in arrays.reversed() {
            print(j)
        }
    }
    
    //MARK:数组的增删改.创建数组一直要为可变数组
    func aboutOprationArry()
    {
        //增加数组元素
        var addArray = ["赫赫","赤赤","嘟嘟","花花"]
        addArray.append("小赤佬")
        print(addArray)
        
        //通过下标修改数组元素
        addArray[1] = "豆豆"
        print(addArray)
        
        //通过下标删除数组元素
        addArray.remove(at: 2)
        print(addArray)
    }
    
    //MARK:合并数组（不可变数组合并到可变数组）
    func aboutAppendArray()
    {
        var addArray = ["赫赫","赤赤","嘟嘟","花花"]
        let newArray = ["123","230"]
        addArray += newArray
        print(addArray)
    }
    
    //MARK:字典增删改，定义字典和字典数组.同样使用的是中括号.
    func aboutDication()
    {
        //创建字典
        let dic:[[String:Any]] = [
            ["name":"赫赫","age":18],
            ["name":"嘟嘟","age":30]
        ]
        print(dic)
        
        //给字典添加键值对
        var dication:[String:Any] = ["name":"赫赫","age":18]
        dication["title"] = "增加值"
        print(dication)
        //修改字典中的值
        dication["title"] = "减少值"
        print(dication)
        //删除字典的key和vaule
        dication.removeValue(forKey:"name")
        print(dication)
        
    }
    
    //MARK:遍历字典
    func aboutErgodiCation()
    {
        let ergodiDic:[String:Any] = ["name":"土豆", "age":"1", "age":10]
    
        for e in ergodiDic{
            print(e)
        }
    }
    
    
    
    //MARK:定义函数:函数名（参数：参数类型）-> 返回值类型
    func funcname(x:Int,y:Int) -> Int {
        return x + y
    }
    //MARK:闭包模式
    //带参数闭包模式 {（形参列表）-> 返回值类型 in //实现类型}
    func close(completion:@escaping () -> ()) -> (){
        DispatchQueue.global().async {
            print("耗时操作")
//            DispatchQueue.main.async {
                //回调，执行闭包
                completion()
//            }
        }
    }
    
    //MARK:发起网络请求
    func requestNetWork()
    {
        let url = URL(string:"http://www.baidu.com")
        URLSession.shared.dataTask(with: url!){ (data, _, _)in
            guard let respondsData = data else{
                print("网络请求失败")
                return
            }
            let html = String(data:respondsData,encoding:.utf8)
            print("\(html)")
        }.resume()
    }
    

}






