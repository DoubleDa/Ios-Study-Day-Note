#import <Foundation/Foundation.h>

//声明外部函数
int change();
int main(int argc, char *argv[])
{
	@autoreleasepool
	{
		extern int count;
		change();
		NSlog(@"%d",count);
		count=100;
		change();
	}
}
