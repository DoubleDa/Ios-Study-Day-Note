#import <Foundation/Foundation.h>

void fac(int num)
{
	auto int a=1;
	static int b=1;
	a+=num;
	b+=num;
	NSLog(@"a的值为:%d,b的值为:%d",a,b);
}
int main(int argc, char *argv[])
{
	@autoreleasepool
	{
		for(int i=0;i<5;i++){
			fac(i);
		}
	}
}
