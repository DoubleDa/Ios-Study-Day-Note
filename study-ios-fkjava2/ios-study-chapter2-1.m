#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
	/*
	第三章流程控制与数组：分支语句：if/switch；循环语句：while、do while、for、foreach
	*/
	@autoreleasepool{
		int age=45;
		if(age>=18&&age<30){
			NSLog(@"青年人");
		}else if(age>30&&age<50){
			NSLog(@"中年人");
		}else if(age>=50){
			NSLog(@"老年人");
		}

		//short、char、int、long等整型和枚举类型
		char score='C';
		switch(score){
			case 'A':
				NSLog(@"优秀");
				break;
			case 'B':
				NSLog(@"良好");
				break;
			case 'C':
				NSLog(@"中等");
				break;
			case 'D':
				NSLog(@"及格");
				break;
			case 'E':
				NSLog(@"不及格");
				break;
			default:
				NSLog(@"输入错误！");
		}

		/*
		循环结构
		*/
		int count=0;
		while(count<10){
			NSLog(@"count:%d",count);
			count++;
		}
		NSLog(@"循环结束");

		/*
		for循环
		*/
		for(int count=0;count<10;count++){
			NSLog(@"count:%d",count);
		}
		NSLog(@"循环结束");

		for(int a=0,b=0,c=0;a<10&&b<12&&c<20;a++){
			NSLog(@"a:%d",a++);
			NSLog(@"b:%d,c:%d",b++,c++);
		}

		/*
		嵌套循环
		*/
		for(int i=0;i<5;i++){
			for(int j=0;j<3;j++){
				NSLog(@"%d,%d",i,j);
			}
		}
		/*
		使用break
		*/
		for(int i=0;i<10;i++){
			NSLog(@"%d",i);
			if(i==2){
				NSLog(@"Success！");
				break;
			}
		}
		/*
		使用return结束函数
		*/
		for(int i=0;i<10;i++){
			for(int j=0;j<12;j++){
				NSLog(@"i:%d,j:%d",i,j);
				if(j>=2){
					return 0;
				}
			}
		}
		NSLog(@"循环执行后的语句");
		/*
		goto循环
		*/
		int i=0;
		start:
			NSLog(@"i:%d",i);
		i++;
		if(i<10){
			goto start;
		}

		/*
		数组
		*/
		//定义数组：type arrayName[length]
		int arr[10];

		//数组的初始化
		int myArray[5]={12,1,234,45,67};

		int len=3;
		int arr[len];
		int arr1[5]={1,2,3,4,5};
		int arr2[5]={1,2,3};
		int arr3[]={1,2,3,4,5};
		//指针类型数组
		NSDate *arr4[5];
		char *arr5[]={"Android","ios","WindowsPhone"};
		NSString *arr6[5]={@"Android",@"Ios"};

		//使用数组：使用sizeof(数组变量)/sizeof(数组变量[0])函数确定数组长度
		int arr7[5]={1,24,67};
		for(int i=0,len=sizeof(arr7)/sizeof(arr7[0]);i<len;i++){
			NSLog(@"arr7[%d],%d",i,arr7[i]);
		}
		arr7[0]=23;
		arr7[1]=567;

		/*
		多维数组：type arrayName[length][length]
		*/
		float arr[3][4];
		int iArray[3][5];
		//多维数组的初始化
		int arr[3][4]={{1,2,3,4},{5,6,7,8},{9,0,1,2}};
		//遍历多维数组
		for(int i=0,len1=sizeof(arr)/sizeof(arr[0]);i<len1;i++){
			for(int j=0,len2=sizeof(arr)/sizeof(arr[i][0];j<len2;j++)){
				NSLog(@"%d%d",arr[i][j]);
			}
		}

		/*
		字符数组
		*/
		char arr[]={'A','D','E','','L','U'};
		for(int i=0,len=sizeof(arr)/sizeof(arr[0]);i<len;i++){
			NSLog(@"@c",arr[i]);
		}

		/*
		字符数组保存字符串
		*/
		char str[]="i love ios!";
		char str[20]="i love ios!";
	}
}
