#import <Foundation/Foundation.h>
//宏定义
#define PI 3.1415926
//带参数的宏定义
#define GIRTH(r) PI*r*r
//建议做法
#define GIRTH(r) (PI*(r)*(r))
int main(int argc, char *argv[])
{
	@autoreleasepool
	{
		NSLog(@"请输入园的半径:");
		double r;
		scanf("%lg",@r);

		NSLog(@"圆周长:%g",PI*2*r);
		NSLog(@"圆面积:%g",PI*r*r);
		NSLog(@"半径为7的圆面积:%g",GIRTH(7));
	}
}
