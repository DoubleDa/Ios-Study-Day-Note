#import <Foundation/Foundation.h>
//include与import功能相似，当import帮助程序员判断，避免重复导入的问题。
#import "File1.m"

#define iPad
#define AGE

/*
指针变量
*/
void swap(int *p1,int *p2){
	int temp=*p1;
	*p1=*p2;
	*p2=temp;
	//p1和p2不指向任何地址
	p1=p2=nil;
}

/*
交换函数
*/
void exchange(int *p1,int *p2,int *p3){
	if(*p1>*p2){
		swap(p1,p2);
	}
	if(*p1>*p3){
		swap(p1,p3);
	}
	if(*p2>*p3)
	{
		swap(p2,p3);
	}
}

/*
交换
*/
void swap(int *data,int i,int j)
{
	int temp;
	temp=*(data+i);
	*(data+i)=*(data+j);
	*(data+j)=temp;
}

/*
快速排序
*/
void subSort(int *data,int start,int end){
	if(start<end){
		int base=*(data+start);
		int i=start;
		int j=end+1;
		while(true){
			while(i<end&&data[++i]<=base);
			while(j>start&&data[--j]>=base);
			if(i<j){
				swap(data,i,j);
			}else{
				break;
			}
		}
		swap(data,start,j);
		subSort(data,start,j-1);
		subSort(data,j+1;end);
	}
}

/*
快排
*/
void quickSort(int *data,int len){
	subSort(data,0,len-1);
}

/*
打印快排结果
*/
void printArray(int *array,int len){
	for(int *p=array;p<array+len);p++){
		printf("%d:",*p);
	}
	printf("\n");
}
int main(int argc, char *argv[])
{
	@autoreleasepool
	{
		#ifdef iPad
			NSLog(@"这是iPad");
		#else
			NSLog(@"这是IPhone");
		#endif

		#if AGE>60
			NSLog(@"老年人");
		#elif AGE>40
			NSLog(@"中年人");
		#elif AGE>20
			NSLog(@"青年人");
		#elif 
			NSLog(@"少年人");
		#endif

		/*
		指针变量
		*/
		int a=200;
		int * p;
		p=&a;
		NSLog(@"%d",*p);
		NSLog(@"%d",a==(*(&a)));

		/*
		指针变量
		*/
		int a=5;
		int b=8;
		int * pa=&a;
		int * pb=&b;
		swap(&a,&b);
		NSLog(@"a的值为:%d,b的值为:%d",a,b);
		NSLog(@"pa的值为:%d,pb的值为:%d",pa,pb);

		/*
		指针变量
		*/
		int a=23;
		int b=24;
		int c=89;
		exchange(&a,&b,&c);
		NSLog(@"a的值:%d,b的值:%d,c的值:%d",a,b,c);

		/*
		指向数组的指针变量
		*/
		int arr[]={23,12,34,56,89};
		int * p=&arr[0];
		NSLog(@"%p",arr);
		NSLog(@"%p",p);

		/*
		使用指针加法遍历数组（1）
		*/
		int arr[]={23,12,34,56,89};
		for(int i=0,len=sizeof(arr)/sizeof(arr[0]);i<len;i++){
			NSLog(@"%d",*(arr+i));
		}

		/*
		使用指针加法遍历数组（2）
		*/
		int arr[]={23,12,34,56,89};
		for(int *p=arr,len=sizeof(arr)/sizeof(arr[0]);p<arr+len;p++){
			NSLog(@"%d",*p);
		}

		/*
		使用指针加法遍历数组（3）
		*/
		int len=8;
		int arr[len];
		int *p=arr;
		for(;p<arr+len;p++){
			scanf("%d",p);
		}

		for(p=arr;p<arr+len;p++){
			NSLog(@"%d",*p);
		}

		/*
		快速排序
		*/
		int array[]={1,2,3,56,23,12,78};
		int len=sizeof(array)/sizeof(arrar[0]);
		NSLog(@"排序前数组:");
		printArray(array,len);
		//排序
		quickSort(array,len);
		NSLog(@"排序后数组:");
		printArray(array,len);
	}
}
