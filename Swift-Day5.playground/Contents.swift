//: Playground - noun: a place where people can play

import UIKit

/*
 *Swift 类
 */
//Swift 中类和结构体有很多共同点。共同处在于：
//1、定义属性用于存储值
//2、定义方法用于提供功能
//3、定义附属脚本用于访问值
//4、定义构造器用于生成初始化值
//5、通过扩展以增加默认实现的功能
//6、符合协议以对某类提供标准功能
class MarkStudents
{
    var mark : Int
    init(mark : Int)
    {
        self.mark=mark
    }
}

class stuMarks {
    var mark = 100
}

var stu = stuMarks()

print("分数为：\(stu.mark)")

//作为引用类型访问类属性
class stuMyMarks
{
    var mark1 = 100
    var mark2 = 200
    var mark3 = 300
}

var myStu = stuMyMarks()

print("测试数据1：\(myStu.mark1)")
print("测试数据2：\(myStu.mark2)")
print("测试数据3：\(myStu.mark3)")

//恒等运算符
//因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例
class SampleClass : Equatable{
    let pro : String
    init(s : String){
        pro = s
    }
}

func ==(lhs : SampleClass,rhs : SampleClass) -> Bool {
    return lhs.pro == rhs.pro
}

let spClass1 = SampleClass(s : "Hello")
let spClass2 = SampleClass(s : "Hello")


if(spClass1 === spClass2){
    print("相等！")
}

if(spClass1 !== spClass2){
    print("不等于")
}

//Swift 属性
//Swift 属性将值跟特定的类、结构或枚举关联。
//属性可分为存储属性和计算属性:
struct MyNumber
{
    var dig : Int
    let pi = 3.1415926
}

//设置默认值
var num = MyNumber(dig : 123)
//设置新值
num.dig = 20


print("结构体数字为：\(num.dig)")
print("结构体数字为：\(num.pi)")


//延迟存储属性
//延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。
//在属性声明前使用 lazy 来标示一个延迟存储属性。


//注意：
//必须将延迟存储属性声明成变量（使用var关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。

//延迟存储属性一般用于：
//1、延迟对象的创建。
//2、当属性的值依赖于其他未知类
class sample
{
    lazy var no = number()
}

class number {
    var name = "Swift教程"
}

var test = sample()
print("延迟加载：\(test.no.name)")


//计算属性
//除存储属性外，类、结构体和枚举可以定义计算属性，计算属性不直接存储值，而是提供一个 getter 来获取值，一个可选的 setter 来间接设置其他属性或变量的值
class SampleTest
{
    var  no1 = 0.0
    var  no2 = 0.0
    var length = 200.0,breadth = 300.0
    var middle : (Double,Double)
    {
        get{
            return (length/2,breadth/2)
        }
        
        set(temp){
            no1 = temp.0 - length/2
            no2 = temp.1 - breadth/2
        }
    }
}

var result = SampleTest()

print("未赋值结果为：\(result.middle)")
result.middle=(0.1,23.6)

print("结果1：\(result.no1)")
print("结果2：\(result.no2)")

//只读计算属性
//只有 getter 没有 setter 的计算属性就是只读计算属性
class film
{
    var head = ""
    var dur = 0.0
    var metaInfo : [String : String]{
        return[
            "head":self.head,
            "dur":"\(self.dur)"
        ]
    }
}

var movie = film()
movie.head = "欢乐颂"
movie.dur = 2.3


print(movie.metaInfo["head"])
print(movie.metaInfo["dur"])

//属性观察器
//注意：
//不需要为无法重载的计算属性添加属性观察器，因为可以通过 setter 直接监控和响应值的变化。


//可以为属性添加如下的一个或全部观察器：
//1、willSet在设置新的值之前调用
//2、didSet在新的值被设置之后立即调用
//3、willSet和didSet观察器在属性初始化过程中不会被调用


class TestCounter {
    var counter : Int = 0 {
        willSet(newTotal){
            print("计数器：\(newTotal)")
        }
        
        didSet
        {
            if( counter > oldValue)
            {
                print("新增数：\(counter - oldValue)")
            }
        }
    }
    
}

var myTest = TestCounter()
myTest.counter = 100
myTest.counter = 30

//全局变量和局部变量


//类型属性
//类型属性是作为类型定义的一部分写在类型最外层的花括号（{}）内。
//使用关键字 static 来定义值类型的类型属性，关键字 class 来为类定义类型属性。
//struct StructName{
//    static var property = ""
//    static var getTestProperty : Int
//        {}
//}
//
//enum EnumName {
//    static var property = ""
//    static var getTestProperty : Int{}
//}
//
//class ClassName {
//   class var getTestProperty : Int {
//        
//    }
//}


//获取和设置类型属性的值
//类似于实例的属性，类型属性的访问也是通过点运算符(.)来进行。但是，类型属性是通过类型本身来获取和设置，而不是通过实例
struct StudentSMarks {
    static let markCount = 88
    static var totalCount = 0
    var InternalMarks : Int = 0 {
        didSet {
            if InternalMarks > StudentSMarks.markCount
            {
                InternalMarks = StudentSMarks.markCount
            }
            
            if InternalMarks > StudentSMarks.totalCount
            {
                StudentSMarks.totalCount = InternalMarks
            }
        }
    }
    
}

var stu1 = StudentSMarks()
var stu2 = StudentSMarks()

stu1.InternalMarks = 89
print("\(stu1.InternalMarks)")

stu2.InternalMarks = 50
print("\(stu2.InternalMarks)")
        