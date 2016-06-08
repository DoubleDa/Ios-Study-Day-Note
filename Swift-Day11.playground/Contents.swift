//: Playground - noun: a place where people can play

import UIKit

//Swift 泛型
//1、Swift 提供了泛型让你写出灵活且可重用的函数和类型。
//2、Swift 标准库是通过泛型代码构建出来的。
//3、Swift 的数组和字典类型都是泛型集。

//定义一个交换两个变量的函数
func exchange(inout a : Int,inout b : Int){
    let temp = a
    a = b
    b = temp
}

var num1 = 100
var num2 = 200
print("未交换的数据为：\(num1)-\(num2)")

exchange(&num1, b: &num2)
print("交换后的数据为：\(num1)-\(num2)")

//泛型函数可以访问任何类型
func myExchange<T>(inout a : T,inout b : T){
    let temp = a
    a = b
    b=temp
}

var num3 = 100
var num4 = 300

print("交换前：\(num3)-\(num4)")

myExchange(&num3, b: &num4)

print("交换后：\(num3)-\(num4)")

var str1 = "A"
var str2 = "B"
print("交换前：\(str1)-\(str2)")

myExchange(&str1, b: &str2)

print("交换后：\(str1)-\(str2)")

//泛型类型
//Swift 允许你定义你自己的泛型类型。
//自定义类、结构体和枚举作用于任何类型

struct Custom<T> {
    var items = [T]()
    mutating func push(item : T){
        items.append(item)
    }
    
    mutating func pop() -> T{
        return items.removeLast()
    }
}

var cus = Custom<String>()
cus.push("测试1")
print(cus.items)

cus.push("测试2")
print(cus.items)

cus.push("测试3")
print(cus.items)

cus.pop()
print(cus.items)
//扩展泛型 TOS 类型
extension Custom{
    var first : T?{
        return items.isEmpty ? nil : items[items.count-1]
    }
}

if let item1 = cus.first{
    print("打印棧顶元素：\(item1)")
}

//类型约束
//类型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成


//类型约束语法
//你可以写一个在一个类型参数名后面的类型约束，通过冒号分割，来作为类型参数链的一部分
func findStringIndex(array:[String],valueToFind:String) -> Int?{
    for(index,value) in array.enumerate(){
        if value == valueToFind
        {
            return index
        }
    }
    return nil
}

let strings = ["A","B","C","D","E"]
if let foundIndex = findStringIndex(strings, valueToFind: "C"){
    print("搜索元素的下表为：\(foundIndex)")
}

//关联类型实例
//Swift 中使用 typealias 关键字来设置关联类型
protocol Container{
    //定义了一个ItemType关联类型
    associatedtype ItemType
    mutating func append(item : ItemType)
    var count : Int {get}
    subscript(i : Int) -> ItemType {get}
}

//遵循Container协议的泛型
struct Tos<T> : Container{
    var items = [T]()
    
    mutating func push(item : T){
        items.append(item)
    }
    
    mutating func pop() -> T{
        return items.removeLast()
    }
    
    mutating func append(item: T) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i : Int) -> T{
        return items[i]
    }
    
}

var tos = Tos<String>()

tos.push("测试啦1")
tos.push("测试啦2")
print("打印1：\(tos.items)")

tos.pop()
print("打印2：\(tos.items)")


tos.append("测试啦3")
print("打印3：\(tos.items)")

print("数组数量为：\(tos.count)")

//Where 语句
//类型约束能够确保类型符合泛型函数或类的定义约束。
//你可以在参数列表中通过where语句定义参数的约束。
//你可以写一个where语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个或多个类型和关联类型间的等价(equality)关系。

func allItemsMatch<C1 : Container,C2 : Container where C1.ItemType == C2.ItemType,C1.ItemType : Equatable>(someContainer : C1,anotherContainer : C2) -> Bool {
    //检查两个Container的元素个数是否相同
    if someContainer.count != anotherContainer.count{
        return false
    }
    
    for i in 0..<someContainer.count{
        if someContainer[i] != anotherContainer[i]{
            return false
        }
    }
    return true
}
var tos1 = Tos<String>()
tos1.push("哒哒")

var tos2 = Tos<String>()
tos2.push("哒哒")

print(allItemsMatch(tos1, anotherContainer: tos2))


/**
 *Swift 访问控制
 */
//协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变量和函数
//模块指的是以独立单元构建和发布的Framework或Application。在Swift 中的一个模块可以使用import关键字引入另外一个模块。
//源文件是单个源码文件，它通常属于一个模块， 源文件可以包含多个类和函数 的定义。
//Swift 为代码中的实体提供了三种不同的访问级别:public、internal、private

//1、Public：可以访问自己模块中源文件里的任何实体，别人也可以通过引入该模块来访问源文件里的所有实体
//2、Internal：可以访问自己模块中源文件里的任何实体，但是别人不能访问该模块中源文件里的实体
//3、Private：只能在当前源文件中使用的实体，称为私有实体
public class MyPublicClass{}
internal class MyInternalClass{}
private class MyPrivateClass{}

public var test1 = 0
internal var test2 = 1
private var test3 = 3

//函数类型访问权限
//private func myFunc() -> (MyPublicClass,MyInternalClass){
//    return nil
//}

//枚举类型访问权限
//枚举中成员的访问级别继承自该枚举，你不能为枚举中的成员单独申明不同的访问级别

//子类访问权限
//子类的访问级别不得高于父类的访问级别

//

