#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
	/*
	输出信息（多行注释）
	*/
	@autoreleasepool
	{
		//执行输出（单行注释）
		NSLog(@"Hello Objective-C！");
		//分隔符-分号
		int age=18;
		NSString* name=@"哒哒";
		NSString* hello=[@"你好！" stringByAppendingString:@"Objective-C!"];

		//花括号
		{

		}

/*
方括号
*/
//数组
a[2]=89;
//对象方法
NSString* str=@"我厨（上海）科技有限公司";
NSLog(@"字符串长度：%ld",[str length]);

type varName;

//正确
int value=68;
//提示警告
int temp=99999999999999;
//正确
long long bigValue=99999999999999;
NSLog(@"%d",temp);
NSLog(@"%lld",bigValue);

//八进制
int temp=012;
//十进制
int data=12;
//十六进制
int varName=0x13;
int varName1=0X13;
NSLog(@"%d",temp);
NSLog(@"%d",data);
NSLog(@"%d",varName);
NSLog(@"%d",varName1);

//无符号整型
unsigned int my=89;

//字符型
char aChar='A';
char bChar='/r';
char c=89;
NSLog(@"%c",c);
NSString s=@"测试";

//浮点型
float/double/long double

/*
枚举型
*/
//方法一：先定义枚举类型，再用枚举类型定义变量
enum season{spring,summer,fall,winter};
enum season type1,type2;
type1=spring;
type2=winter;

//方法二：定义枚举类型时直接定义变量
enum {boy,girl} me,you;
	}
	return 0;
}


