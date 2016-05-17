#import <Foundation/Foundation.h>
#import <math.h> 

int main(int argc, char *argv[])
{
	@autoreleasepool{
		/*
		自动类型转换
		*/
		int a=6;
		float b=a;
		NSLog(@"%g",b);
		short c=78;
		char d=c;
		NSLog(@"%c",d);
		double e=c;
		NSLog(@"%g",e);
		double f=67.8967;
		int g=f;
		NSLog(@"%d",g);
		char h=f;
		NSLog(@"%c",h);
		int i=33000;
		short j=i;
		NSLog(@"%d",j);
		/*
		强制类型转换
		*/
		int aValue=100;
		int bValue=9;
		float fValue1=a/b;
		float fValue2=(float)a/b;
		NSLog(@"%g",fValue1);
		NSLog(@"%g",fValue2);
		int it=(int)2.3+(int)122.3;
		NSLog(@"%d",it);
		/*
		表达式类型的自动提升
		*/
		short sValue=5;
		NSLog(@"ld",sizeof(sValue-3));
		double dValue=sValue/2.0;
		NSLog(@"%g",dValue);
		/*
		运算符
		*/
		//算数运算符
		double a=8.9;
		double b=4.5;
		double sum=a+b;
		NSLog(@"%g",sum);

		double a=5.6;
		double b=4.5;
		double sub=a-b;
		NSLog(@"%g",sub);

		double a=5.6;
		double b=3.4;
		double mul=a*b;
		NSLog(@"%g",mul);

		double a=4.5;
		double b=6.7;
		double div=a/b;
		NSLog(@"%g",div);

		NSLog(@"5除以0.0的结果是：%g",5/0.0);
		NSLog(@"-5除以0.0的结果是：%g",-5/0.0);
		NSLog(@"-5.0除以0的结果是：%g",-5/0);

		int a=5;
		int b=4;
		int mod=a%b;
		NSLog(@"%d",mod);
		NSLog(@"5对0.0求余的结果是：%g",5%0);

		int a=7;
		int b=a++ +6;
		int c=a-- +6;
		NSLog(@"%d,%d,%d",a,b,c);

		int a=7;
		int b=++a +6;
		int c=a--+6;
		NSLog(@"%d,%d,%d",a,b,c);

		//复杂运算符
		double a=4.5;
		//a的5次方
		double b=pow(a,5);
		NSLog(@"%g",b);
		//a的平方根
		double c=sqrt(a);
		NSLog(@"%g",c);
		//计算随机数
		double d=arc4random()%10;
		NSLog(@"%g",d);
		//sin
		double e=sin(2.45);
		NSLog(@"%g",e);

		/*
		赋值运算符
		*/
		NSString *str=@"demo";
		double pi=3.14;
		BOOL enable=YES;
		NSString *str1=str;

		/*
		位运算符：&|~^<<>>
		*/
		NSLog(@"%d",5&9);
		NSLog(@"%d",5|9);
		NSLog(@"%d",~-6);
		NSLog(@"%d",5^9);
		NSLog(@"%d",5<<2);
		NSLog(@"%d",-5>>2);

		/*
		扩展后的赋值运算符
		*/
		int a=6;
		int b=3;
		NSLog(@"%d",a+=b);
		NSLog(@"%d",a-=b);
		NSLog(@"%d",a*=b);
		NSLog(@"%d",a/=b);
		NSLog(@"%d",a%=b);
		NSLog(@"%d",a&=b);
		NSLog(@"%d",a|=b);
		NSLog(@"%d",a^=b);
		NSLog(@"%d",a<<=b);
		NSLog(@"%d",a>>=b);

		/*
		比较运算符（1、0）
		*/
		NSLog(@"%d",(5>4.9));
		NSLog(@"%d",(5==5.0));
		NSLog(@"%d",(97=='a'));
		NSLog(@"%d",(YES==NO);
		NSDate *t1=[[NSDate alloc] init];
		NSDate *t2=[[NSDate alloc] init];
		NSLog(@"%d",(t1==t2));

		/*
		逗号运算符
		*/
		int a=9;
		a=(a*=3,5<9);
		NSLog(@"%d",a);
		int x=(a=3,a=5,a=7,a=10);
		NSLog(@"%d,%d",x,a);
	}
}
