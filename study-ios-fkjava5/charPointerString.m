#import <Foundation/Foundation.h>

/*
字符指针作为函数参数
*/
void copyString(char * to,char * from)
{
	while(*from){
		*to++=*from++;
	}
	*to='\0';
}

int main(int argc, char *argv[])
{
	@autoreleasepool
	{
		//使用字符指针表示字符串
		char * str="I Love Ios";
		NSLog(@"%s",str);
		str+=7;
		NSLog(@"%s",str);
	}
}
