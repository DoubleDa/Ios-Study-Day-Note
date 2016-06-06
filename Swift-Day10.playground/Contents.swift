//: Playground - noun: a place where people can play

import UIKit

//Swift 协议
//协议规定了用来实现某一特定功能所必需的方法和属性。
//任意能够满足协议要求的类型被称为遵循(conform)这个协议。
//类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。

//1、对属性的规定
//在类型声明后加上{ set get }来表示属性是可读可写的，只读属性则用{ get }来表示
protocol classa{
    var marks : Int {set get}
    var result : Bool {get}
    
    func attendance() -> String
    func markssecured() -> String
}

protocol classb : classa {
    var present : Bool {set get}
    var subject : String {set get}
    var stuname : String {set get}
}

class classc: classb {
    var marks = 99
    let result = true
    var present = false
    var subject = "Swift协议"
    var stuname = "哒哒"
    
    func attendance() -> String {
        return "\(stuname)"
    }
    
    func markssecured() -> String {
        return "\(stuname)的课程：\(subject)考试成绩为：\(marks)"
    }
}

let stu = classc()
stu.marks = 88
stu.present = true
stu.stuname = "哒哒"
stu.subject = "数学"

print(stu.attendance())

print(stu.markssecured())

//2、对 Mutating 方法的规定
//有时需要在方法中改变它的实例。
//例如，值类型(结构体，枚举)的实例方法中，将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改它所属的实例及其实例属性的值

protocol daysofaweek {
    mutating func show()
}

enum days : daysofaweek {
    case one,two,three,four,five,six,seven
    mutating func show() {
        switch self {
        case .one:
            print("one")
        case .two:
            print("two")
        case .three:
            print("three")
        case .four:
            print("four")
        case .five:
            print("five")
        case .six:
            print("six")
        case .seven:
            print("seven")
        default:
            print("default")
        }
    }
}

var day = days.five
day.show()

//3、对构造器的规定
//协议可以要求它的遵循者实现指定的构造器。
//你可以像书写普通的构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体
protocol tcpprotocol{
    init(num1 : Int)
}

//4、协议构造器规定在类中的实现
//你可以在遵循该协议的类中实现构造器，并指定其为类的指定构造器或者便利构造器。在这两种情况下，你都必须给构造器实现标上"required"修饰符

//使用required修饰符可以保证：所有的遵循该协议的子类，同样能为构造器规定提供一个显式的实现或继承实现
class superClass
{
    var num1 : Int
    init(num1 : Int)
    {
        self.num1 = num1
    }
}

class childClass : superClass,tcpprotocol {
    var num2 : Int
    init(num1 : Int,num2 : Int){
        self.num2 = num2
        super.init(num1: num1)
    }
    
    //因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
    required override convenience init(num1 : Int){
        self.init(num1 : num1,num2: 0)
    }
}

let sup = superClass(num1 : 12)
let chi = childClass(num1: 20,num2: 90)


print("sup中的num1为：\(sup.num1)")
print("chi中的num1位：\(chi.num1)")
print("chi中的num2位：\(chi.num2)")


//协议类型
//尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用。
//协议可以像其他普通类型一样使用，使用场景:
//1、作为函数、方法或构造器中的参数类型或返回值类型
//2、作为常量、变量或属性的类型
//3、作为数组、字典或其他容器中的元素类型

protocol Generator {
    associatedtype member
    func next() -> String
}

var item = [1,3,4,7,8,12].generate()
while let x = item.next(){
    print(x)
}

for lists in [1,2,3].map({i in i*5}){
    print(lists)
}

print([12,23,34])
print([12,23,34].map({i in i*12}))

//在扩展中添加协议成员
//我们可以可以通过扩展来扩充已存在类型( 类，结构体，枚举等)。
//扩展可以为已存在的类型添加属性，方法，下标脚本，协议等成员
protocol AgeClasificationProtocol{
    var age : Int {get}
    func ageType() -> String
}

class  Student {
    let firstName : String
    let lastName : String
    var age : Int
    
    init(firstName : String,lastName : String){
        self.firstName = firstName
        self.lastName = lastName
        self.age = 18
    }
}

extension Student : AgeClasificationProtocol{
    func fullName() -> String{
        var temp : String
        temp = firstName + " " + lastName
        return temp
    }
    
    func ageType() -> String {
        switch age {
        case 0...2:
            return "婴儿"
        case 3...12:
            return "小孩"
        case 13...18:
            return "未成年人"
        case 19...30:
            return "年轻人"
        default:
            return "老年人"
        }
    }
}

var testStu = Student(firstName: "da",lastName: "yongxin")
testStu.ageType()
testStu.fullName()

//协议的继承
//协议能够继承一个或多个其他协议，可以在继承的协议基础上增加新的内容要求。
//协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔：
protocol tempA{
    var num1 : Int{get}
    func count(sum : Int)
}

protocol countResult{
    func printInfo(target : tempA)
}

class stuA: countResult {
    func printInfo(target : tempA){
        target.count(1)
    }
}

class stuB: countResult {
    func printInfo(target: tempA) {
        target.count(5)
    }
}

class stuC: tempA {
    var num1: Int = 10
    func count(sum: Int) {
        num1 -= sum
        print("学生尝试\(sum)次通过")
        
        if(num1 < 0){
            print("缺席考试")
        }
    }
}

class Teacher {
    var temp : countResult!
    init(temp : countResult){
        self.temp = temp
    }
    
    func printInfo(target : tempA){
        temp.printInfo(target)
    }
}

var marks = Teacher(temp : stuA())
var mark = stuC()
marks.printInfo(mark)

marks.temp = stuB()

marks.printInfo(mark)


//类专属协议
//你可以在协议的继承列表中,通过添加class关键字,限制协议只能适配到类（class）类型。
//该class关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议

//协议合成
//Swift 支持合成多个协议，这在我们需要同时遵循多个协议时非常有用
protocol stName{
    var name : String{get}
}

protocol stAge {
    var age : Int{get}
}

struct mStudent : stName,stAge {
    var name : String
    var age : Int
}

func show(temp : protocol<stName,stAge>){
    print("\(temp.name)的年龄为：\(temp.age)")
}

let pers = mStudent(name: "哒哒",age: 18)
print(pers)

//检验协议的一致性
//1、你可以使用is和as操作符来检查是否遵循某一协议或强制转化为某一类型。
//2、is操作符用来检查实例是否遵循了某个协议。
//    as?返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil。
//3、as用以强制向下转型，如果强转失败，会引起运行时错误

protocol hasArea {
    var area : Double{get}
}

class Circle: hasArea {
    let pi = 3.1415926
    var radius : Double
    var area : Double{
        return pi * radius * radius
    }
    init(radius : Double)
    {
        self.radius = radius
    }
}

class country: hasArea {
    var area : Double
    init(area : Double){
        self.area = area
    }
}

class Animal {
    var age : Int
    init(age : Int){
        self.age = age
    }
}

let obj : [AnyObject] = [Circle(radius : 3.4),country(area : 34.56),Animal(age : 4)]

for objItem in obj{
//    对迭代出的每一个元素进行检查，看它是否遵循了HasArea协议
    if let tempArea = objItem as? hasArea{
        print("面积为：\(tempArea.area)")
    }else{
        print("没有面积")
    }
}

//TODO Swift 泛型
        