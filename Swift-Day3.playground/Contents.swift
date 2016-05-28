//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*Swift 字典*/
//Swift 字典用来存储无序的相同类型数据的集合

//1、创建字典
var dictA = [Int : String]()
var dict : [Int : String] = [2:"dyx",5:"test"]

//2、访问字典
var temp = dict[2]
var test = dict[5]
print(test)
print(temp)

/*修改字典*/
//方法一
var oldTemp = dict.updateValue("新值", forKey: 5)
print("旧值为：\(oldTemp)")
print("新值为：\(dict[5])")

//方法二
dict[2] = "新值2"
print("新值为：\(dict[2])")

//移除 Key-Value 对
//方法一
//var removeValue = dict.removeValueForKey(2)

//方法二
dict[2] = nil
//print("移除值为：\(removeValue)")
print("移除之后：\(dict[2])")

//遍历字典
var myDict : [Int : String] = [1:"测试1",2:"测试2",3:"测试3",4:"测试4"]
//方法一
for (key,value) in myDict
{
    print("遍历字典方法一(key,value)：\(key,value)")
}

//方法二
for (key,value) in myDict.enumerate()
{
    print("遍历字典方法二(key,value)：\(key,value)")
}

//字典转换为数组
let dictKey = [Int](myDict.keys)
let dictValue = [String](myDict.values)
print("输出键为：")

for (key) in dictKey
{
    print("输出key：\(key)")
}

print("输出值为：")
for (value) in dictValue
{
    print("输出value：\(value)")
}

//count 属性
var testDictA : [Int : String] = [1:"A",2:"B"]
var testDictB : [Int : String] = [3:"C",4:"D",5:"E"]

print("输出字典长度：")
print("testDictA长度为：\(testDictA.count)")
print("testDictB长度为：\(testDictB.count)")


//isEmpty 属性

var testDictC = [Int : String]()
print("判断字典是否为空：")
print("字典testDictA：\(testDictA.isEmpty)")
print("字典testDictC：\(testDictC.isEmpty)")

/*Swift 函数*/
//函数声明: 告诉编译器函数的名字，返回类型及参数
//函数定义: 提供了函数的实体

func getUserName(name : String) -> String {
    return name
}

print("测试调用函数：\(getUserName("达永新"))")

func addNumber(a : Int,b : Int) -> Int {
    return a + b
}

print("加法运算：\(addNumber(12,b:24))")

//不带参数函数
func myFunc() -> String
{
    return "达永新"
}
print("不带参数函数：\(myFunc())")

//元组作为函数返回值
//元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号
func getMaxMin(array : [Int]) -> (min : Int,max : Int) {
    var tempMax = array[0]
    var tempMin = array[0]
    
    for value in array[1..<array.count] {
        if(value < tempMin)
        {
            tempMin = value
        }else if(value > tempMax){
            tempMax = value
        }
    }
    return (tempMin,tempMax)
}

let mArray = getMaxMin([4,12,-8,17,29,90,-19])
print("最小值为：\(mArray.min)|最大值为：\(mArray.max)")

//安全检查：可选元组类型如(Int, Int)?与元组包含可选类型如(Int?, Int?)是不同的.可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值
func getNewMaxMin(array : [Int]) -> (min : Int,max : Int)?
{
    var currentMax = array[0]
    var currentMin = array[0]

    for value in array[1..<array.count] {
        if(value < currentMin)
        {
            currentMin = value
        }else if(value > currentMax){
            currentMax = value
        }
    }
    return (currentMin,currentMax)
    
}
if let tempCC = getNewMaxMin([4,12,-8,17,29,90,-19])
{
    print("最小值为：\(tempCC.min)|最大值为：\(tempCC.max)")
}

/*函数参数名称*/
//局部参数名
func sample(num : Int)
{
    print("数字为：\(num)")
}

sample(2)

//外部参数名

func myPow(firstArg a : Int,secondArg b : Int) -> Int {
    let result = a * b
    print("计算结果为：\(result)")
    return result
}

myPow(firstArg: 12,secondArg: 26)


//可变参数
func vars<N>(members:N...)
{
    for i in members
    {
        print(i)
    }
}

vars(1,2,4)
vars(2,3,67,89,11)

//常量，变量及 I/O 参数



