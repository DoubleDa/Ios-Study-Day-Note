//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Swift 字符(Character)
let char1 : Character =  "A"
let char2 : Character =  "B"

print(char1)
print(char2)

//空字符变量：Swift 中不能创建空的 Character（字符） 类型变量或常量
let char3 : Character = " "
print(char3)

//遍历字符串中的字符
for ch in "dayongxin.com".characters{
    print(ch)
}

//字符串连接字符
var strA : String = "Hello"
let charD : Character = "A"
strA.append(charD)
print(strA)

/*Swift 数组*/
//创建数组
var mArray = [Int] (count : 5,repeatedValue : 0)

var arrayA : [Int] = [10,20,40,45,67]

//访问数组
var tempArray =  arrayA[1]
print(tempArray)

//修改数组
arrayA.append(89)
print(arrayA[5])

arrayA[1] = 90
print(arrayA[1])

//遍历数组
print("遍历数组：")
for item in arrayA
{
    print(item)
}


//如果我们同时需要每个数据项的值和索引值，可以使用 String 的 enumerate() 方法来进行数组遍历
var strArray = [String]()

strArray.append("重庆")
strArray.append("上海")
strArray.append("天津")
strArray.append("北京")

for (index,item) in strArray.enumerate(){
    print("\(index)处的元素为：\(item)")
}

//合并数组
var array1 = [Int](count:3,repeatedValue:0)
var array2 = [Int](count:5,repeatedValue:0)

var array3 = array1 + array2
//遍历方法一
print("遍历方法一：")
for item in array3
{
    print(item)
}

//遍历方法二
print("遍历方法二：")
for (index,item) in array3.enumerate()
{
    print("\(index)处有元素：\(item)")
}

//count 属性
print("合并后的数组长度为：\(array3.count)")


//isEmpty 属性
print("数组array3是否为空：\(array3.isEmpty)")
var array4 = [Int]()
print("数组array4是否为空：\(array4.isEmpty)")

//Swift 字典




