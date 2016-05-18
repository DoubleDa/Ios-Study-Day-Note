#import <Foundation/Foundation.h>

/*
全局变量
*/
int sum;
int avg;
int max;
int min;

void statistics(int nums[],unsigned long len){
	min=nums[0];
	for(int i=0;i<len;i++){
		if(nums[i]>max)
		{
			max=nums[i];
		}
		if(nums[i]<min){
			min=nums[i];
		}
		sum+=nums[i];
	}
	avg=sum/len;
}

/*
在函数内部定义全局变量
*/
void change(){
    extern int globalVar;
    globalVar=20;
}

int main(int argc, char *argv[])
{
	@autoreleasepool{
		int nums[]={1,23,34,2,56,78,9,80};
		statistics(nums,sizeof(nums)/sizeof(nums[0]));

		NSLog(@"总和：%d",sum);
		NSLog(@"平均值:%d",avg);
		NSLog(@"最大值:%d",max);
		NSLog(@"最小值:%d",min);
	}
}

int globalVar;