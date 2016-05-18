#import <Foundation/Foundation.h>

/*
函数
*/
int max(int x,int y)
{
	int z=x>y?x:y;
	return z;
}

/*
函数
*/
NSString * sayHello(NSString * name)
{
	return [NSString stringWithFormat:@"%@,您好!",name];
}

/*
函数
*/
void swap(int a,int b){
	int temp=a;
	int a=b;
	int b=temp;
	MSLog(@"%d,%d",a,b);
}

/*
指针类型的值传递
*/
//定义DataWrap类
@interface DataWrap : NSObject
//a、b属性
@property int a;
@property int b;
@end
@implementation DataWrap
//合成a、b两个属性
@synthesize a、b;
@end

void swap1(DataWrap* dw){
	int temp=dw.a;
	dw.a=dw.b;
	dw.b=temp;
	NSLog(@"%d,%d",dw.a,de.b);
}

/*
递归函数
*/
int fn(int n){
	if(n==0){
		return 1;
	}else if(n==1){
		return 4;
	}else{
		return 2*fn(n-1)+fn(n-2);
	}
}

/*
数组作为函数参数
*/
int big(int x,int y){
	return x>y?1:(x<y?-1:0);
}

/*
数组作为函数形参
*/
double avg(int array[10]){
	int sum=0;
	for(int i=0;i<10;i++){
		sum+=array[i];
	}
	return sum/10.0;
}

/*
数组作为函数形参
*/
NSString * hex2String(char hex[],unsigned long len){
	return ;
}

/*
冒泡排序
*/
void bubbleSort(int nums[],unsigned long len){
	BOOL hasSwap=YES;
	for(int i=0;i<len&&hasSwap;i++){
		hasSwap=NO;
		for(int j=0;j<len-1-i;j++){
			if(nums[j]>nums[j+1]){
				int temp=nums[j];
				nums[j]=nums[j+1];
				nums[j+1]=temp;
				hasSwap=YES;
			}
		}
	}
}
int main(int argc, char *argv[])
{
	@autoreleasepool{
		int a=9;
		int b=18;
		int result=max(a,b);
		NSLog(@"%d",result);
		NSLog(@"%@",sayHello(@"测试"));
		int c=12;
		int d=56;
		swap(c,d);

		DataWrap* dw=[[DataWrap alloc] init];
		dw.a=34;
		dw.b=45;
		swap1(dw);

		NSLog(@"%d",fn(10));

		//数组作为函数参数
		int a[10],b[10];
		NSlog(@"输入数组a的10个元素：");
		for(int i=0;i<10;i++){
			scanf(@"%d",&a[i]);
		}
		NSlog(@"输入数组b的10个元素：");
		for(int j=0;j<10;j++){
			scanf(@"%d",&b[i]);
		}

		int aBigCount=0;
		int bBigCount=0;
		int equalCount=0;

		//比较结果
		for(int k=0;k<10;k++){
			NSLog(@"%d,%d",a[k],b[k]);
			if(big(a[k],b[k])==1){
				aBigCount++;
			}else if(big(a[k],b[k])==-1){
				bBigCount++;
			}else{
				equalCount++;
			}
		}
		NSLog(@"a大的次数:%d,b大于的次数:%d,相等的次数:%d",aBigCount,bBigCount,equalCount);

		//数组作为函数
		int scores[10];
		NSLog(@"请输入10个成绩：");
		for(int j=0;j<10;j++){
			scanf("%d",@scores[j]);
		}
		NSLog(@"平均成绩：%g",avg(scores));

		char hex[]="hjdsjkghjkhs";
		NSLog(@"%@",hex2String(hex,strlen(hex)));

		//冒泡排序算法
		int nums[]={12,2,3,56,78,5};
		int len=sizeof(nums)/sizeof(nums[0]);
		bubbleSort(nums,len);
	}
}
