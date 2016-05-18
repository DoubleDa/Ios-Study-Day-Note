#import <Foundation/Foundation.h>
/*
打印矩形（外部函数）
*/
extern void printRect(int height,int width){
	for(int i=0;i<height;i++){
		for(int j=0;j<width;j++){
			printf("*");
		}
		printf("\n");
	}
}


int main(int argc, char *argv[])
{
	printf("Hello, world\n");
	return 0;
}
