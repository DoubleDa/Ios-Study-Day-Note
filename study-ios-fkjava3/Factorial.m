#import <Foundation/Foundation.h>

int fac(int n){
	static int f=1;
	f=f*n;
	return f;
}
int main(int argc, char *argv[])
{
	@autoreleasepool{
		for(int i=0;i<8;i++){
			NSLog(@"%d,%d",i,fac(i));
		}
	}
}
