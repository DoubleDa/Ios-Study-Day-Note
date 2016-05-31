//: Playground - noun: a place where people can play

import UIKit

/*Swift 类*/
//类和结构体对比
//Swift 中类和结构体有很多共同点。共同处在于：
//1、定义属性用于存储值
//2、定义方法用于提供功能
//3、定义附属脚本用于访问值
//4、定义构造器用于生成初始化值
//5、通过扩展以增加默认实现的功能
//6、符合协议以对某类提供标准功能
//与结构体相比，类还有如下的附加功能：
//1、继承允许一个类继承另一个类的特征
//2、类型转换允许在运行时检查和解释一个类实例的类型
//3、解构器允许一个类实例释放任何其所被分配的资源
//4、引用计数允许对一个类的多次引用

class Student{
    var stuName : String
    var stuNum : Int
    var stuAge : Int
    var stuSchoolName : String
    init(stuName : String,stuNum : Int,stuAge : Int,stuSchoolName : String){
        self.stuName = stuName
        self.stuNum = stuNum
        self.stuAge = stuAge
        self.stuSchoolName = stuSchoolName
    }
}
class MyStudent {
    var stuName = "dayongxin"
    var stuNum = 2010212253
    var stuAge = 18
    var stuSchoolName = "CQUPT"
}
var stu = MyStudent();
print("姓名：\(stu.stuName)")
print("学号：\(stu.stuNum)")
print("年龄：\(stu.stuAge)")
print("学校：\(stu.stuSchoolName)")

//作为引用类型访问类属性


/*Swift 方法*/
//实例方法
//在 Swift 语言中，实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
//实例方法提供以下方法：
//1、可以访问和修改实例属性
//2、提供与实例目的相关的功能
class Counter{
    var count = 0
    
    func increment(){
        count += 1
    }
    
    func incrementBy(amount : Int)  {
        count += amount
    }
    
    func reset()  {
        count = 0
    }
    
}


//初始值
let counter = Counter()
counter.count

counter.increment()
counter.count

counter.incrementBy(10)
counter.count

counter.reset()
counter.count

//方法的局部参数名称和外部参数名称
class division
{
    var count : Int = 0
    func incrementBy(no1 : Int,no2 : Int){
        count = no1/no2
        print(count)
    }
    
}

var myCounter = division()
myCounter.incrementBy(200, no2: 20)
//Swift 默认仅给方法的第一个参数名称一个局部参数名称;默认同时给第二个和后续的参数名称为全局参数名称

//是否提供外部名称设置
class multiplication
{
    var count : Int = 0
    func incrementBy(first no1 : Int,no2 : Int){
        count = no1 * no2
        print(count)
    }
    
}

var mMultiplication = multiplication()

mMultiplication.incrementBy(first: 20, no2: 10)


//self 属性
//类型的每一个实例都有一个隐含属性叫做self，self 完全等同于该实例本身。
//你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例。

class calculations {
    let a : Int
    let b : Int
    let result : Int
    
    init(a : Int,b : Int)
    {
        self.a = a;
        self.b = b;
        result = a+b
        print("内部结果为：\(result)")
    }
    
    func totoal(c : Int) -> Int {
        return result - c
    }
    
    func printInfo() {
        print("结果1：\(totoal(10))")
        print("结果2：\(totoal(50))")
    }
}

let mCalculations = calculations(a : 20,b : 30)
let mCalculations1 = calculations(a : 50,b : 100)


mCalculations.printInfo()
mCalculations1.printInfo()


//在实例方法中修改值类型
struct area{
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length * breadth
    }
    //选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中
    mutating func areaBy(res : Int){
        length *= res
        breadth *= res
        
        print(length)
        print(breadth)
    }
}

var myArea = area(length: 3,breadth: 5)

print("矩形面积为：\(myArea.area())")
myArea.areaBy(5)
print("新矩形面积为：\(myArea.area())")

//在可变方法中给 self 赋值

struct area1{
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length * breadth
    }
    //选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中
    mutating func areaBy(res : Int){
        self.length *= res
        self.breadth *= res
        
        print(length)
        print(breadth)
    }
}

var val = area1(length: 5,breadth: 10)
val.area()
val.areaBy(40)

//类型方法
//实例方法是被类型的某个实例调用的方法，你也可以定义类型本身调用的方法，这种方法就叫做类型方法。
//声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的实现方法。
//类型方法和实例方法一样用点号(.)语法调用。

class Math{
    class func abs(num : Int) -> Int {
        if(num < 0)
        {
            return (-num)
        }else{
            return num
        }
    }
}

struct absNum {
    static func abs(num : Int) -> Int{
        if(num < 0)
        {
            return (-num)
        }else{
            return num
        }

    }
}

let val1 = Math.abs(-67)
let val2 = absNum.abs(-78)

/*Swift 下标脚本*/

//下标脚本 可以定义在类（Class）、结构体（structure）和枚举（enumeration）这些目标中，可以认为是访问对象、集合或序列的快捷方式，不需要再调用实例的特定的赋值和访问方法。

//下标脚本语法及应用
struct subexample
{
    let temp : Int
    subscript(index : Int) -> Int
    {
        return temp/index
    }
    
}

let result = subexample(temp : 100)
print("100除以10的结果为：\(result[9])")

class dayWeek {
    private var days = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"]
    subscript(index : Int) -> String
    {
        get{
            return days[index]
        }
        
        set(newValue){
            self.days[index] = newValue
        }
    }
}

var p = dayWeek()

p[0]
p[6]



//下标脚本选项
struct Matrix{
    let rows : Int,columns : Int
    var array : [Double]
    init(rows : Int,columns : Int)
    {
        self.rows = rows
        self.columns = columns
        array = Array(count : rows * columns,repeatedValue : 0.0)
    }
    
    subscript(rows : Int,columns : Int) -> Double
    {
        get{
            return array[(rows * columns) + columns]
        }
        
        set(newValue)
        {
            array[(rows * columns) + columns] = newValue
        }
    }
    
}

var mat = Matrix(rows: 3,columns: 5)
mat[0,1]=1.2
mat[2,3]=8.9
mat[1,4]=6.7

print("第一个值：\(mat[0,1])")
print("第二个值：\(mat[2,3])")
print("第三个值：\(mat[1,4])")

//Swift 继承
//基类
//没有继承其它类的类，称之为基类（Base Class）。
class StuDetail
{
    var stuName : String!
    var chineseMark : Int!
    var mathMark : Int!
    var englishMark : Int!
    
    init(stuName : String,chineseMark : Int,mathMark : Int,englishMark : Int)
    {
        self.stuName = stuName
        self.chineseMark = chineseMark
        self.mathMark = mathMark
        self.englishMark = englishMark
    }
    
    func show(){
        print("姓名：\(self.stuName)-语文：\(self.chineseMark)-数学：\(self.mathMark)-英语：\(self.englishMark)")
    }
}

let name = "dayongxin"
print(name)

let chinese = 80
print(chinese)

let math = 97
print(math)

let english = 88
print(english)


//子类
//子类指的是在一个已有类的基础上创建一个新的类。
class Dayongxin : StuDetail{
    init(){
        super.init(stuName: "dayongxin", chineseMark: 80, mathMark: 99, englishMark: 86)
    }
}

var dada = Dayongxin()

dada.show()


//重写（Overriding）

//重写方法和属性

class SuperClass {
    func showInfo() {
        print("这是SuperClass")
    }
}

class childClass : SuperClass {
    override func showInfo() {
        print("这是childClass")
    }
}

var supObject = SuperClass()
supObject.showInfo()

var childObject = childClass()
childObject.showInfo()

//重写属性
//注意点：
//如果你在重写属性中提供了 setter，那么你也一定要提供 getter。
//如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字。
class Circle{
    var radius = 10.4
    var area : String{
        return "矩形半径为：\(radius)"
    }
}

class Rec : Circle {
    var result = 8
    override var area: String{
        return super.area + ",修改之后的值为：\(result)"
    }
    
}

let testTemp = Rec()
testTemp.result = 10
testTemp.radius = 23.7

print("矩形面积为：\(testTemp.area)")

//重写属性观察器
//你可以在属性重写中为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会监测到。
//注意：你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。
class Square : Rec{
    override var radius: Double{
        didSet{
            result = Int(radius/4.5)+2
        }
    }
}
let  sq = Square()
sq.radius = 23.7
print("面积为：\(sq.area)")


//防止重写
//我们可以使用 final 关键字防止它们被重写。
//如果你重写了final方法，属性或下标脚本，在编译时会报错。

//TODO Swift 构造过程








