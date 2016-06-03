//: Playground - noun: a place where people can play

import UIKit

/*
 *Swift 类型转换
 */
//Swift 语言类型转换可以判断实例的类型。也可以用于检测实例类型是否属于其父类或者子类的实例。
//Swift 中类型转换使用 is 和 as 操作符实现，is 用于检测值的类型，as 用于转换类型。
//类型转换也可以用来检查一个类是否实现了某个协议

//1、定义一个类层次
class Subjects{
    var physics : String
    init(physics : String)
    {
        self.physics = physics
    }
}

class Chemistry : Subjects {
    var organic : String
    init(physics : String,organic : String){
        self.organic = organic
        super.init(physics: physics)
    }
}

class Math : Subjects {
    var equation : String
    init(physics : String,equation : String)
    {
        self.equation = equation
        super.init(physics: physics)
    }
    
}

//let sa = [Chemistry(physics : "物理",organic : "力学"),Math(physics : "函数",equation: "多元函数")]

let sample = Chemistry(physics: "物理" , organic: "力学")

sample.physics
sample.organic

let sampleMath = Math(physics: "数学",equation: "二次函数")
sampleMath.physics
sampleMath.equation

//2、检查类型
//类型检查使用 is 关键字。
//操作符 is 来检查一个实例是否属于特定子类型
let temp = [
    Chemistry(physics : "化学",organic: "有机化合物"),
    Math(physics : "数学",equation: "二次函数"),
    Chemistry(physics : "化学",organic: "卤化物"),
    Math(physics : "数学",equation: "函数")
]

var chemCount = 0
var mathCount = 0
for item in temp{
    if item is Chemistry{
        chemCount += 1
    }else if item is Math
    {
        mathCount += 1
    }
}

print("化学：\(chemCount)-数学：\(mathCount)")

//3、向下转型

//向下转型，用类型转换操作符(as? 或 as!)
//1、当你不确定向下转型可以成功时，用类型转换的条件形式(as?)
//2、只有你可以确定向下转型一定会成功时，才使用强制形式(as!)

for item1 in temp{
    if let show = item1 as? Chemistry{
        print("化学：\(show.physics)-\(show.organic)")
    }else if let example = item1 as? Math{
        print("数学：\(example.physics)-\(example.equation)")
    }
}

//4、Any和AnyObject的类型转换
//Swift为不确定类型提供了两种特殊类型别名：
//1、AnyObject可以代表任何class类型的实例。
//2、Any可以表示任何类型，包括方法类型（function types）。

//可以存储Any类型的数组 exampleany
var exampleany = [Any]()
exampleany.append(11)
exampleany.append(2.568)
exampleany.append("哒哒")
exampleany.append(Chemistry(physics: "化学",organic: "化合物"))

for itemExample in exampleany{
    switch itemExample{
        case let mInt as Int :
            print("整型为：\(mInt)")
        case let mDouble as Double :
            print("浮点型为：\(mDouble)")
        case let mString as String :
            print("字符串为：\(mString)")
        case let mChemistry as Chemistry:
            print("对象为：\(mChemistry)")
        default :
            print("none")
    }
}

//AnyObject数组 
let exampleAnyObject : [AnyObject] = [
    Chemistry(physics : "化学",organic: "有机化合物"),
    Math(physics : "数学",equation: "二次函数"),
    Math(physics : "数学",equation: "一次函数"),
    Chemistry(physics : "化学",organic: "卤化物")
]

for item2 in exampleAnyObject{
    if let show = item2 as? Chemistry{
        print("名称：\(show.physics)-内容：\(show.organic)")
    }else if let example = item2 as? Math
    {
        print("名称：\(example.physics)-内容：\(example.equation)")
    }
}

//在一个switch语句的case中使用强制形式的类型转换操作符（as, 而不是 as?）来检查和转换到一个明确的类型


/*
 *Swift 扩展
 */
//扩展就是向一个已有的类、结构体或枚举类型添加新功能。
//扩展可以对一个类型添加新的功能，但是不能重写已有的功能。
//Swift 中的扩展可以：
//1、添加计算型属性和计算型静态属性
//2、定义实例方法和类型方法
//3、提供新的构造器
//4、定义下标
//5、定义和使用新的嵌套类型
//6、使一个已有类型符合某个协议


//1、语法
//扩展声明使用关键字 extension
//一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议

//2、计算型属性
extension Int{
    var add : Int{return self + 100}
    var sub : Int{return self - 10}
    var mul : Int{return self * 8}
    var div : Int{return self / 2}
}

let addResult = 5.add
print("加法结果为：\(addResult)")

let subResult = 89.sub
print("减法结果为：\(subResult)")

let mulResult = 7.mul
print("乘法结果为：\(mulResult)")

let divResult = 10.div
print("除法结果为：\(divResult)")

let mixResult = 20.add + 67.sub + 90.mul + 100.div
print("混合运算结果为：\(mixResult)")


//3、构造器
//扩展可以向已有类型添加新的构造器。
//这可以让你扩展其它类型，将你自己的定制类型作为构造器参数，或者提供该类型的原始实现中没有包含的额外初始化选项。
//扩展可以向类中添加新的便利构造器 init()，但是它们不能向类中添加新的指定构造器或析构函数 deinit() 。

struct struct1 {
    var num1 = 100,num2 = 200
}

struct struct2 {
    var no1 = 100,no2 = 200
}

struct struct3 {
    var temp1 = struct1()
    var temp2 = struct2()
}

let struct3Test = struct3()
struct3Test.temp1.num1
struct3Test.temp1.num2

struct3Test.temp2.no1
struct3Test.temp2.no2

//let struct3Test1 = struct3(temp1: struct1(num1: 10,num2: 20),temp2: struct2(no1: 10,no2: 20))
//
//
//struct3Test1.temp1.num1
//struct3Test1.temp1.num2
//
//struct3Test1.temp2.no1
//struct3Test1.temp2.no2

//构造器
extension struct3{
    init(a : struct1,b: struct2){
        _ = a.num1 + a.num2
        _ = b.no1 + b.no2
    }
}


let struct3Test1 = struct3(temp1: struct1(num1: 10,num2: 20),temp2: struct2(no1: 10,no2: 20))


struct3Test1.temp1.num1
struct3Test1.temp1.num2

struct3Test1.temp2.no1
struct3Test1.temp2.no2


//方法
//扩展可以向已有类型添加新的实例方法和类型方法。

extension Int{
    func topics(sum: () -> ()){
        for _ in 0..<self{
            sum()
        }
    }
}

4.topics({
    print("扩展方法")
})

//可变实例方法
//通过扩展添加的实例方法也可以修改该实例本身。
//结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样
extension Double{
    //标注为mutating
    mutating func square(){
        let pi = 3.4678
        self = pi * self * self
    }
}

var tempVar = 3.4
tempVar.square()
print("圆的面积为：\(tempVar)")

//下标
//扩展可以向一个已有类型添加新下标
extension Int {
    subscript(var multtable: Int) -> Int {
        var no1 = 1
        while multtable > 0 {
            no1 *= 10
            multtable -= 1
        }
        return (self / no1) % 10
    }
}

print(12[0])
print(120[1])
print(48[3])


//嵌套类型
//扩展可以向已有的类、结构体和枚举添加新的嵌套类型
extension Int{
    //枚举
    enum calculator {
        case add
        case sub
        case mul
        case div
        case mix
    }
    
    //类 
    var print : calculator{
        switch self {
        case 0:
            return .add
        case 1:
            return .sub
        case 2:
            return .mul
        case 3:
            return .div
        default:
            return .mix
        }
    }
}

func result(nums : [Int]) {
    for item in nums{
        switch item.print {
        case .add:
            print("加法")
        case .sub:
            print("减法")
        case .mul:
            print("乘法")
        case .div:
            print("除法")
        default:
            print("混合运算")
        }
    }
}
result([0,1,2,6,3,4])


/*
 *Swift 协议
 */
//协议规定了用来实现某一特定功能所必需的方法和属性。
//任意能够满足协议要求的类型被称为遵循(conform)这个协议。
//类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。


//对属性的规定

