#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
	@autoreleasepool{
		//局部变量
		{
			int a;
			NSLog(@"未赋值的a:%d",a);
			a=10;
			NSLog(@"赋值之后的:%d",a);
		}
		NSLog(@"代码块之外的a:%d",a);
	}
}
