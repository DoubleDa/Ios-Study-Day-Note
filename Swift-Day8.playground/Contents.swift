//: Playground - noun: a place where people can play

import UIKit

/*Swift 析构过程*/
//在一个类的实例被释放之前，析构函数被立即调用。用关键字deinit来标示析构函数，类似于初始化函数用init来标示。析构函数只适用于类类型

//swift 会自动释放不再需要的实例以释放资源。
//Swift 通过自动引用计数（ARC）处理实例的内存管理。
//通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。
//例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前关闭该文件。


//var counter = 0
//class SuperClass {
//    init()
//    {
//        counter += 1;
//    }
//    
//    deinit{
//        counter -= 1;
//    }
//}
//
//var result : SuperClass? = SuperClass()
//print(counter)
//result = nil
//print(counter)

/*Swift 可选链*/

//可选链（Optional Chaining）是一种可以请求和调用属性、方法和子脚本的过程，用于请求或调用的目标可能为nil。
//可选链返回两个值：
//如果目标有值，调用就会成功，返回该值
//如果目标为nil，调用将返回nil
//多次请求或调用可以被链接成一个链，如果任意一个节点为nil将导致整条链失效。


//使用感叹号(!)可选链实例
//class Person
//{
//    var educationn : Education?
//}
//
//class Education {
//    var schoolName = "CQUPT"
//}
//
//let dada = Person()
//
//if let personName = dada.educationn?.schoolName{
//    print("学校存在")
//}else{
//    print("学校不存在")
//}

//为可选链定义模型类
//你可以使用可选链来多层调用属性，方法，和下标脚本。这让你可以利用它们之间的复杂模型来获取更底层的属性，并检查是否可以成功获取此类底层属性
//class Person
//{
//    var residence : Residence?
//}

//class Residence{
//    var rooms = [Room]()
//    var numbersOfRoom : Int
//    {
//        return rooms.count
//    }
//    
//    subscript(i : Int) ->Room{
//        return rooms[i]
//    }
//    
//    func printRoomNum() {
//        print("房间编号为：\(numbersOfRoom)")
//    }
//    
//    var address : Address?
//}

//class Room{
//    let roomName : String
//    init(name : String)
//    {
//        self.roomName = name
//    }
//}

//class Address {
//    var buildingStreet : String?
//    var buildingName : String?
//    var buildingNumber : String?
//    
//    func buildingAddress() -> String?{
//        if (buildingName != nil){
//            return buildingName
//        }else if(buildingNumber != nil)
//        {
//            return buildingNumber
//        }else{
//            return nil
//        }
//    }
//}

//通过可选链调用方法
//你可以使用可选链的来调用可选值的方法并检查方法调用是否成功。即使这个方法没有返回值，你依然可以使用可选链来达成这一目的
//let dada = Person()
//if((dada.residence?.printRoomNum()) != nil)
//{
//    print("输出房间成功！")
//}else{
//    print("输出房间失败！")
//}

//使用可选链调用下标脚本
//let dada = Person()
//if let firstRoomName = dada.residence?.rooms[0].roomName{
//    print("第一间房间为：\(firstRoomName)")
//}else{
//    print("没有查到第一间房间！")
//}

//
//let dada = Person()
//let dadaRoom = Residence()
//
//dadaRoom.rooms.append(Room(name : "厨房"))
//dadaRoom.rooms.append(Room(name : "书房"))
//dadaRoom.rooms.append(Room(name : "客厅"))
//
//dada.residence = dadaRoom
//
//if let firstRoomName = dada.residence?.rooms[0].roomName{
//    print("第一间房间为：\(firstRoomName)")
//}else
//{
//    print("没有查到第一间房间！")
//}

//访问可选类型的下标
//var testScors = ["stuA":[56,67,58],"stuB":[78,89,90]]
//testScors["stuA"]?[0] = 90
//print(testScors)
//
//testScors["stuB"]?[0] += 1
//print(testScors)
//
//testScors["stuC"]?[0] = 99
//print(testScors)

//连接多层链接
//你可以将多层可选链连接在一起，可以掘取模型内更下层的属性方法和下标脚本。然而多层可选链不能再添加比已经返回的可选值更多的层。
//let dada = Person()
//dada.residence?[0] = Room(name : "客厅")

//let dadaHouse = Residence()
//dadaHouse.rooms.append(Room(name : "书房"))
//dadaHouse.rooms.append(Room(name : "卧室"))
//
//dada.residence = dadaHouse


//if let dadaStreet = dada.residence?.address?.buildingStreet{
//    print("街道地址为：\(dadaStreet)")
//}else{
//    print("没有街道地址！")
//}
//if let dadaHouseName = dada.residence?[0].roomName{
//    print("第一间房间为：\(dadaHouseName)")
//}else{
//    print("不存在第一间房间！")
//}
//
////对返回可选值的函数进行链接
//if dada.residence?.printRoomNum() != nil
//{
//    print("房间不为空！")
//}else
//{
//    print("房间为空！")
//}

/*Swift 自动引用计数（ARC）*/
//Swift 使用自动引用计数（ARC）这一机制来跟踪和管理应用程序的内存

//ARC 功能
//1、当每次使用init()方法创建一个类的新的实例的时候，ARC会分配一大块内存用来储存实例的信息。
//2、内存中会包含实例的类型信息，以及这个实例所有相关属性的值。
//3、当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。
//4、为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。
//5、实例赋值给属性、常量或变量，它们都会创建此实例的强引用，只要强引用还在，实例是不允许被销毁的。

//class Student{
//    let stuName : String
//    init(name : String)
//    {
//        self.stuName = name
//        print("类被初始化！")
//    }
//    
//    deinit
//    {
//        print("类被析构！")
//    }
//}

//值会被自动初始化为nil，目前还不会引用到Person类的实例
//var stuA : Student?
//var stuB : Student?
//var stuC : Student?

//创建Person类的新实例
//stuA = Student(name : "哒哒")
//
////赋值给其他两个变量，该实例又会多出两个强引用
//stuB = stuA
//stuC = stuA
//
////断开第一个强引用
//stuA = nil
//
////断开第一个强引用
//stuB = nil
//
////断开第一个强引用，调用析构函数
//stuC = nil

//类实例之间的循环强引用
//在上面的例子中，ARC 会跟踪你所新创建的 Person 实例的引用数量，并且会在 Person 实例不再被需要时销毁它。
//然而，我们可能会写出这样的代码，一个类永远不会有0个强引用。这种情况发生在两个类实例互相保持对方的强引用，并让对方不被销毁。这就是所谓的循环强引用

//class Student {
//    let stuName : String
//    init(stuName : String)
//    {
//        self.stuName = stuName
//    }
//    var stuHouse : StuHouse?
//    
//    deinit{
//        print("\(stuName)被析构！")
//    }
//}
//
//class StuHouse {
//    let num : Int
//    init(stuNum : Int)
//    {
//        self.num = stuNum
//    }
//    var stuA : Student?
//    deinit{
//        print("宿舍\(num)被析构！")
//    }
//}
//
////两个变量都被初始化为nil
//var dada1 : Student?
//var house1 : StuHouse?

//赋值
//dada1 = Student(stuName : "哒哒")
//house1 = StuHouse(stuNum : 22)

//感叹号是用来展开和访问可选变量dada1和house1中的实例
//循环强引用被创建
//dada1!.stuHouse = house1
//house1!.stuA = dada1
//
////断开 runoob 和 number73 变量所持有的强引用时，引用计数并不会降为 0，实例也不会被 ARC 销毁
////注意，当你把这两个变量设为nil时，没有任何一个析构函数被调用
////强引用循环阻止了Person和Apartment类实例的销毁，并在你的应用程序中造成了内存泄漏
//dada1 = nil
//house1 = nil


//解决实例之间的循环强引用
//Swift提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：
//1、弱引用
//2、无主引用


//弱引用实例
//class Module{
//    let name : String
//    init(name : String){
//        self.name = name
//    }
//    var sub : SubModule?
//    deinit{
//        print("\(name)主模块！")
//    }
//}
//
//class SubModule {
//    let number : Int
//    init(number : Int){
//        self.number = number
//    }
//    //弱引用
//    weak var mod : Module?
//    deinit{
//        print("\(number)子模块！")
//    }
//}
//
//var mod1 : Module?
//var sub1 : SubModule?
//
//mod1 = Module(name : "哒哒")
//sub1 = SubModule(number : 11)
//
//mod1!.sub = sub1
//sub1!.mod = mod1
//
//mod1 = nil
//sub1 = nil


//无主引用实例
//class Student
//{
//    let name : String
//    var marks : Marks?
//    init(name : String){
//        self.name = name
//    }
//    deinit{
//        print("\(name)")
//    }
//}
//
//class Marks{
//    let mark : Int
//    unowned let stu : Student
//    init(mark : Int,stuName : Student){
//        self.mark = mark
//        self.stu = stuName
//    }
//    
//    deinit{
//        print("学生：\(stu),分数为：\(mark)")
//    }
//}
//
//var modu : Student?
//modu = Student(name : "哒哒")
//modu!.marks = Marks(mark: 100,stuName: modu!)
//

//闭包引起的循环强引用
//循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了实例。这个闭包体中可能访问了实例的某个属性，例如self.someProperty，或者闭包中调用了实例的某个方法，例如self.someMethod。这两种情况都导致了闭包 "捕获" self，从而产生了循环强引用

class HTMLElement {
    
    let name : String
    let text : String?
    
    lazy var asHTML: () -> String = {
        //弱引用和无主引用
        [unowned self] in
        if let text = self.text{
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name)>"
        }
    }
    
    init(name : String,text : String? = nil){
        self.name = name
        self.text = text
    }
    
    deinit{
        print("\(name)被初始化！")
    }
}

//HTMLElement 类产生了类实例和 asHTML 默认值的闭包之间的循环强引用。
//实例的 asHTML 属性持有闭包的强引用。但是，闭包在其闭包体内使用了self（引用了self.name和self.text），因此闭包捕获了self，这意味着闭包又反过来持有了HTMLElement实例的强引用。这样两个对象就产生了循环强引用。
//解决闭包引起的循环强引用:在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用
var html : HTMLElement? = HTMLElement(name: "p",text: "健康的说法比较恐怖")
print(html?.asHTML)

html = nil

//TODO Swift 类型转换










