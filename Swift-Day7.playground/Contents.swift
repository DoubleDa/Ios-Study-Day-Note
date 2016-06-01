//: Playground - noun: a place where people can play

import UIKit

/*Swift 构造过程*/
//与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
//类实例也可以通过定义析构器（deinitializer）在类实例释放之前执行清理内存的工作

//存储型属性的初始赋值

//存储属性在构造器中赋值流程：
//1、创建初始值。
//2、在属性定义中指定默认属性值。
//3、初始化实例，并调用 init() 方法。

//构造器
struct ractangle{
    var width : Int
    var height : Int
    
    init()
    {
        width=12
        height=40
    }
}

var result = ractangle()
print("矩形面积为：\(result.width*result.height)")

//默认属性值
//使用默认值能让你的构造器更简洁、更清晰，且能通过默认值自动推导出属性的类型。

struct area {
    var width = 10
    var height = 34
}

var testArea = area()

print("矩形面积为：\(testArea.width*testArea.height)")


//构造参数
//你可以在定义构造器 init() 时提供构造参数，
struct myRectangle{
    var width : Double
    var height : Double
    var area : Double
    
    init(fromWidth width : Double,fromHeight height : Double){
        self.width = width
        self.height = height
        area = width * height
    }
    
    
    init(fromLang widthNew : Double,fromLang heightNew : Double){
        self.width = widthNew
        self.height = heightNew
        area = widthNew * heightNew
    }
}

var testMyRectangle1 = myRectangle(fromWidth: 12.3,fromHeight: 45.3)
testMyRectangle1.area

var testMyRectangle2 = myRectangle(fromLang: 3.56,fromLang: 3.904)
testMyRectangle2.area

//内部和外部参数名
//调用构造器时，主要通过构造器中的参数名和类型来确定需要调用的构造器。
struct Color
{
    let red , blue ,green : Double
    init(red : Double,blue : Double,green : Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white : Double)
    {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let testColor1 = Color(red: 0.3,blue: 0.5,green: 0.9)
testColor1.red
testColor1.green
testColor1.blue


let testColor2 = Color(white : 0.6)
testColor2.red
testColor2.green
testColor2.blue

//没有外部名称参数
//如果你不希望为构造器的某个参数提供外部名字，你可以使用下划线_来显示描述它的外部名。
struct stuMark{
    var mathMark : Double?
    init(fromStuA mark : Double )
    {
        self.mathMark = mark * 0.8
    }
    
    init(fromStuB mark : Double)
    {
        self.mathMark = mark * 0.9
    }
    
    //不提供外部名字
    init(_ totel : Double){
        self.mathMark = totel
    }
    
}

var testStuMark1 = stuMark(fromStuA : 89)
testStuMark1.mathMark

var testStuMark2 = stuMark(fromStuB : 99)
testStuMark2.mathMark

var testStuMark3 = stuMark(100)
testStuMark3.mathMark


//可选属性类型
//如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，你都需要将它定义为可选类型optional type（可选属性类型）。
//当存储属性声明为可选时，将自动初始化为空 nil


//构造过程中修改常量属性
//只要在构造过程结束前常量的值能确定，你可以在构造过程中的任意时间点修改常量属性的值。
//对某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
//尽管 length 属性现在是常量，我们仍然可以在其类的构造器中设置它的值

struct phoneNum{
    let number : Int?
    init(fromA num : Int)
    {
        self.number = num + 1
    }
    
    init(formB num : Int)
    {
        self.number = num + 2
    }
    
    init(_ num : Int)
    {
        self.number = num
    }
    
}

let testPhoneNum1 = phoneNum(18716321583)
testPhoneNum1.number

let testPhoneNum2 = phoneNum(13122430989)
testPhoneNum2.number

let testPhoneNum3 = phoneNum(18716321156)
testPhoneNum3.number

//默认构造器
//默认构造器将简单的创建一个所有属性值都设置为默认值的实例
class ShoppingList{
    var goodsName : String?
    var price = 9.8
    var goodsNum = 3
}

var goods = ShoppingList()
goods.goodsName
goods.price
goods.goodsNum

//结构体的逐一成员构造器
//如果结构体对所有存储型属性提供了默认值且自身没有提供定制的构造器，它们能自动获得一个逐一成员构造器。
struct Area{
    var widthArea = 22.3,heightArea = 12.8
}

var testAreaA = Area(widthArea: 223,heightArea: 128)
testAreaA.widthArea
testAreaA.heightArea

//值类型的构造器代理
//构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复
struct Size{
    var width = 0.0,height = 0.0
}

struct Point {
    var x = 0.0,y = 0.0
}

struct MyArea {
    var size = Size()
    var point = Point()
    init(){}
    
    init(sizeA : Size,pointA : Point){
        self.size = sizeA
        self.point = pointA
    }
    
    init(sizeB : Size,pointB : Point){
        let newX = sizeB.width + pointB.x
        let newY = sizeB.height + pointB.y
        
        self.init(sizeB : Size(width: newX,height: newY),pointB: Point(x: newX,y: newY))
    }
}

let testMyArea = MyArea()
testMyArea.point.x
testMyArea.point.y

testMyArea.size.width
testMyArea.size.height


let testMyAreaA = MyArea(sizeA: Size(width: 11,height: 22),pointA: Point(x: 18,y: 28))

testMyAreaA.point.x
testMyAreaA.point.y

testMyAreaA.size.width
testMyAreaA.size.height

//类的继承和构造过程
//Swift 提供了两种类型的类构造器来确保所有类实例中存储型属性都能获得初始值，它们分别是指定构造器和便利构造器

//指定构造器实例
class MainClass{
    var num1 : Int
    init(num1 : Int){
        self.num1 = num1
    }
}

class ChildClass: MainClass{
    var num2 : Int
    init(num1 : Int,num2 : Int)
    {
        self.num2 = num2
        super.init(num1: num1)
    }
    //便利构造器实例
    //便利方法只需要一个参数
    override convenience init(num1: Int) {
        self.init(num1:num1,num2: 0)
    }
}

var MainClassVar = MainClass(num1 : 10)
MainClassVar.num1

var ChildClassVar = ChildClass(num1: 12,num2: 23)
ChildClassVar.num1
ChildClassVar.num2

//便利构造器实例


//构造器的继承和重载
//Swift 中的子类不会默认继承父类的构造器。
//父类的构造器仅在确定和安全的情况下被继承。
//当你重写一个父类指定构造器时，你需要写override修饰符

class SuperClassA {
    var number = 4
    var description : String{
        return "\(number)边形"
    }
}

let mySuperClassA = SuperClassA()
mySuperClassA.description

class ChildClassA: SuperClassA{
    //重载构造器
    override init() {
        super.init()
        number = 6
    }
}

let myChildClassA = ChildClassA()
myChildClassA.description

//类的可失败构造器
//如果一个类，结构体或枚举类型的对象，在构造自身的过程中有可能失败，则为其定义一个可失败构造器。
//变量初始化失败可能的原因有：
//1、传入无效的参数值。
//2、缺少某种所需的外部资源。
//3、没有满足特定条件。
struct Animal{
    let number : String
    init?(number : String){
        if number.isEmpty
        {
            return nil
        }
        self.number = number
    }
}

let testAnimal = Animal(number : "1000")

if let testVar = testAnimal{
    print("\(testAnimal?.number)")
}


//枚举类型的可失败构造器
//你可以通过构造一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员
enum LengthUnit
{
    case mm,cm,fm,m,km
    init?(item : String)
    {
        switch item {
        case "mm":
            self = .mm
        case "cm":
            self = .cm
        case "fm":
            self = .fm
        case "m":
            self = .m
        case "km":
            self = .km
        default:
            return nil
        }
    }
}

let testLengthUnit = LengthUnit(item : "mm")
if(testLengthUnit != nil)
{
    print("初始化成功！")
}

let testLengthUnit1 = LengthUnit(item : "xm")
if(testLengthUnit1 == nil)
{
    print("初始化失败！")
}


//类的可失败构造器
//值类型（如结构体或枚举类型）的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。
//但是，类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的代理调用发生完后触发失败行为
class StudentRecord
{
    let stuName : String
    init?(stuName : String)
    {
        self.stuName = stuName
        if stuName.isEmpty{
            return nil
        }
    }
    
}

if let stuName = StudentRecord(stuName : "哒哒"){
    print("初始化结果为：\(stuName.stuName)")
}

//覆盖一个可失败构造器
//就如同其它构造器一样，你也可以用子类的可失败构造器覆盖基类的可失败构造器。
//者你也可以用子类的非可失败构造器覆盖一个基类的可失败构造器。
//你可以用一个非可失败构造器覆盖一个可失败构造器，但反过来却行不通。
//一个非可失败的构造器永远也不能代理调用一个可失败构造器

class Planet {
    var name : String
    
    init(name : String){
        self.name = name
    }
    
    convenience init(){
        self.init(name : "哒哒")
    }
}

var planetVar = Planet(name : "测试")
planetVar.name

var planetVar1 = Planet()
planetVar1.name

class planets: Planet {
    var count : Int
    init(name : String,count : Int)
    {
        self.count = count
        super.init(name: <#T##String#>)
    }
    
    override convenience init(name: String) {
        self.init(name: name,count: 1)
    }
}

//可失败构造器 init!
//通常来说我们通过在init关键字后添加问号的方式（init?）来定义一个可失败构造器，但你也可以使用通过在init后面添加惊叹号的方式来定义一个可失败构造器(init!)

struct Studentinfo {
    let stuName : String
    
    init!(stuName : String){
        if stuName.isEmpty{
            return nil
        }
        self.stuName = stuName
    }
    
}

let stu1 = Studentinfo(stuName : "哒哒")
if let name = stu1{
    print("有学生名称！")
}

let  stu2 = Studentinfo(stuName : "")
if stu2 == nil
{
     print("没有学生名称！")
}
//TODO Swift 析构过程


