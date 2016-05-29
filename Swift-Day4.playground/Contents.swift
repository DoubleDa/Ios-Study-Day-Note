//: Playground - noun: a place where people can play

import UIKit

/*
 *Swift 闭包
 */
//Swift中的闭包有很多优化的地方:
//1、根据上下文推断参数和返回值类型
//2、从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
//3、可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
//4、提供了尾随闭包语法(Trailing closure syntax)

let studentName = {print("swift 闭包！")}

studentName()

let divide = {
    (val1 : Int,val2 : Int) -> Int in
    return val1/val2
}

let  result = divide(100,50)

print(result)

//sort 函数
let names = ["Cc","Dd","Ee","Aa","Bb","Zz"]

//使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool
func backwards(s1 : String,s2 : String) -> Bool
{
    return s1 > s2
}

var temp = names.sort(backwards)

print(temp)

//参数名称缩写：Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数
var temp1 = names.sort({ $0 > $1})
print(temp1)

//运算符函数
var temp2 = names.sort(>)
print(temp2)

//尾随闭包：尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
var temp3 = names.sort(){$0 > $1}
print(temp3)

//捕获值：闭包可以在其定义的上下文中捕获常量或变量
func makeIncrementor(forIncrement amount : Int) -> () -> Int
{
    var runningTotal = 0
    func incrementor() -> Int
    {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementTen =  makeIncrementor(forIncrement: 10)

print(incrementTen())

print(incrementTen())

print(incrementTen())

//闭包是引用类型


/*
 *Swift 枚举
 */
//枚举的功能为:
//1、它声明在类中，可以通过实例化类来访问它的值。
//2、枚举也可以定义构造函数（initializers）来提供一个初始成员值；可以在原始的实现基础上扩展它们的功能。
//3、可以遵守协议（protocols）来提供标准的功能。
enum NetType
{
    case SecondG
    case ThridG
    case ForthG
    case FivthG
    case WIFI
}

var net = NetType.ForthG

net = .ForthG

switch net
{
    case .SecondG:
        print("2G")
    case .ThridG:
        print("3G")
    case .ForthG:
        print("4G")
    case .FivthG:
        print("5G")
    case .WIFI:
        print("WIFI")
}

//相关值
enum Student
{
    //姓名
    case Name(String)
    //分数（语文、数学、英语）
    case Mark(Int,Int,Int)
    }

var stuName = Student.Name("达永新")
var stuScore = Student.Mark(80, 97, 89)
switch stuName{
    case .Name(let stuName):
        print("学生姓名：\(stuName)")
    case .Mark(let mark1,let mark2,let mark3):
        print("期末考试得分为：\(mark1)-\(mark2)-\(mark3)")
}

//原始值：原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的
enum Month : Int{
    case Jan=1,Feb,Mar,Apr,May,June,July,Aug,Sep,Oct,Nov,Dec
}
let mMonth = Month.Dec.rawValue
let mMonthHash = Month.Dec.hashValue


print("月份为：\(mMonth)-\(mMonthHash)")


/*
 *Swift 结构体
 */
//与 C 和 Objective C 不同的是：
//1、结构体不需要包含实现文件和接口。
//2、结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口。
//结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改的。

struct MarkStruct {
    var china = 80
    var math = 99
    var english = 88
}

//实例化结构体
let mystruct = MarkStruct()

print("语文成绩为：\(mystruct.china)")
print("数学成绩为：\(mystruct.math)")
print("英语成绩为：\(mystruct.english)")


//实例化通过结构体实例化时传值并克隆一个结构体
struct Mystruct{
    var mark : Int
    init(mark : Int){
        self.mark = mark
    }
}

var structA = Mystruct(mark:90)
var structB = structA

structB.mark = 99
print("structA分数：\(structA.mark)")
print("structB分数：\(structB.mark)")

//结构体应用
//按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
//1、结构体的主要目的是用来封装少量相关简单数据值。
//2、有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
//3、任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
//4、结构体不需要去继承另一个已存在类型的属性或者行为。

struct testStruct {
    var mark1 : Int
    var mark2 : Int
    var mark3 : Int
    
    init(mark1 : Int,mark2 : Int,mark3 : Int)
    {
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
    
}

print("优秀成绩为：")
var goodScore = testStruct(mark1: 99,mark2: 99,mark3: 99)
print("优秀成绩：\(goodScore)")

print("差成绩为：")
var badScore = testStruct(mark1: 34,mark2: 45,mark3: 34)
print("差成绩为：\(badScore)")


//TODO Swift 类






