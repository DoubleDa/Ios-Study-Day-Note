import UIKit

var str="Hello Swift!"

print(str)

//swift标记
print("test")

//swift注释
/*测试注释
 啦啦啦*/

/*swift空格*/
//编码规范推荐使用这种写法
let a=1 + 2;
//这样也是OK的
let b=3+4

/*Swift 字面量*/
//整型字面量
45
//浮点型字面量
3.4567
//字符串型字面量
"dayonxgin"
//布尔型字面量
false

/*swift数据类型*/
/*内置数据类型：Int、UInt、浮点数、布尔值、字符串、字符可选类型（optionals）、Array、Dictionary、Struct、Class*/
//类型别名：typealias newname = type
typealias Feet=Int
var dis:Feet = 200
print(dis)

//类型安全
//类型推断
let age=25
let para = 3.2667
let another = 3+para

/*Swift 变量*/
//变量声明：var variableName = <initial value>
var varA=56
print(varA)

var varB:Float
varB=3.456
print(varB)

//变量命名
var _var="Hello swift"
print(_var)

var  你好 = "你好swift"
var  菜鸟 = "我是swift菜鸟"
print(你好)
print(菜鸟)


//变量输出
var name = "哒哒"
var website = "www.dayongxin.com"
print("\(name)的网站为：\(website)")

//Swift 可选(Optionals)类型：可选类型类似于Objective-C中指针的nil值，但是nil只对类(class)有用，而可选类型对所有的类型都可用，并且更安全
//var myStr:String? = "达永新"
var myStr:String? = nil
if myStr != nil
 {
    print(myStr)
} else {
    print("字符串为空！")
}

//强制解析
var testStr:String?
testStr = "哒哒"
if testStr != nil
{
    //强制解析：使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值
    print(testStr!)
}else{
    print("字符串为空")
}

//自动解析
var tempStr:String!
tempStr = "达永新"
if tempStr != nil{
    print(tempStr)
}else{
    print("字符串为空！")
}

//可选绑定：使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量
var bindStr:String?
bindStr = "测试程序"
if let yourStr = bindStr{
    print("你的字符串为：\(yourStr)")
}else{
    print("你的字符串为空！")
}

/*Swift 常量：数据类型如：整型常量，浮点型常量，字符常量或字符串常量*/
//常量声明：let constantName = <initial value>
let constantA=78
print(constantA)

//类型标注：var constantName:<data type> = <optional initial value>
let constantB:Int = 89
print(constantB)

//常量命名
let _const = "test"
print(_const)

let 测试 = "菜鸟教程"
print(测试)

//常量输出
let websiteName = "达永新"
let websiteUrl = "dayongxin"

print("\(websiteName)的官方网站为：\(websiteUrl)")


/*Swift 字面量*/
//整型字面量
let intType = 45
//字符串字面量
let strType = "达永新"
//布尔值字面量
let boolType = true
print("数字：\(intType)-姓名：\(strType)-是否：\(boolType)")
//整型字面量可以是一个十进制，二进制，八进制或十六进制常量。 二进制前缀为 0b，八进制前缀为 0o，十六进制前缀为 0x，十进制没有前缀
//十进制表示
let decimalismNum = 16
//二进制表示
let binaryNum = 0b1001
//八进制表示
let octonaryNum = 0o21
//十六进制表示
let hexadecimalNum = 0x11
print("十进制：\(decimalismNum)-二进制：\(binaryNum)-八进制：\(octonaryNum)-十六进制：\(hexadecimalNum)")

//浮点型字面量
//十进制浮点型字面量
let decimalismFloat = 12.678
//十进制浮点型字面量
let decimalismDouble = 1.222678e1
//十六进制浮点型字面量
let hexadecimalFloat = 0xC.3p0


//字符串型字面量
let strL = "Hello 哒哒\n的官方网站为：\'http://www.dayongxin.com\'"
print(strL)

/*Swift 运算符*/
//算术运算符
var A = 100
var B = 50
print("A+B结果为：\(A+B)")
print("A-B结果为：\(A-B)")
print("A*B结果为：\(A*B)")
print("A/B结果为：\(A/B)")
print("A%B结果为：\(A%B)")
A++
print("A++结果为：\(A)")
B--
print("B--结果为：\(B)")

/*Swift 字符串*/
//使用字符串字面量
var strA = "Swift 字符串"
print(strA)
//String 实例化
var strB = String("String 实例化")
print(strB)

//空字符串
var strC = ""
if strC.isEmpty
{
    print("字符串为空")
}else{
    print("字符串不为空")
}


//实例化 String 类来创建空字符串
let strD = String()
if strD.isEmpty
{
    print("字符串为空")
}
else
{
    print("字符串不为空")
}

//字符串常量
//strE可被修改
var strE = "我爱iOS"
strE += "非常非常爱"
print(strE)

//strF不可被修改
let strF = String("菜鸟教程")
//strF += "我爱你"
print(strF)

//字符串中插入值
var  tempA = 20
let  constB = 100
var tempC : Float = 20.0

var result = "\(tempA)乘以\(constB)等于\(tempC * 100)"
print(result)

//字符串连接
let constAA = "我爱"
let constBB = "学习iOS"
var constCC = constAA + constBB
print(constCC)

//字符串长度
var strLength = "www.dayongxin.com"
print("字符串\(strLength)长度为：\(strLength.characters.count)")

//字符串比较

var  comA = "Hello world!"
var  comB = "Hello swift!"
if(comA == comB){
    print("两个字符串相等！")
}else
{
    print("两个字符串不相等！")
}

//Unicode 字符串

var  unicodeString = "达永新"
print("UTF-8编码：")
for code in unicodeString.utf8
{
    print("\(code)")
}

print("UTF-16编码：")
for myCode in unicodeString.utf16
{
    print("\(myCode)")
}

//字符串函数及运算符
//1、isEmpty
//2、hasPrefix(prefix: String)：检查字符串是否拥有特定前缀
//3、hasSuffix(suffix: String)：检查字符串是否拥有特定后缀
//4、Int(String)
//5、String.characters.count：计算字符串的长度
//6、utf8／utf16
//7、unicodeScalars










