#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
	/*
	�����Ϣ������ע�ͣ�
	*/
	@autoreleasepool
	{
		//ִ�����������ע�ͣ�
		NSLog(@"Hello Objective-C��");
		//�ָ���-�ֺ�
		int age=18;
		NSString* name=@"����";
		NSString* hello=[@"��ã�" stringByAppendingString:@"Objective-C!"];

		//������
		{

		}

/*
������
*/
//����
a[2]=89;
//���󷽷�
NSString* str=@"�ҳ����Ϻ����Ƽ����޹�˾";
NSLog(@"�ַ������ȣ�%ld",[str length]);

type varName;

//��ȷ
int value=68;
//��ʾ����
int temp=99999999999999;
//��ȷ
long long bigValue=99999999999999;
NSLog(@"%d",temp);
NSLog(@"%lld",bigValue);

//�˽���
int temp=012;
//ʮ����
int data=12;
//ʮ������
int varName=0x13;
int varName1=0X13;
NSLog(@"%d",temp);
NSLog(@"%d",data);
NSLog(@"%d",varName);
NSLog(@"%d",varName1);

//�޷�������
unsigned int my=89;

//�ַ���
char aChar='A';
char bChar='/r';
char c=89;
NSLog(@"%c",c);
NSString s=@"����";

//������
float/double/long double

/*
ö����
*/
//����һ���ȶ���ö�����ͣ�����ö�����Ͷ������
enum season{spring,summer,fall,winter};
enum season type1,type2;
type1=spring;
type2=winter;

//������������ö������ʱֱ�Ӷ������
enum {boy,girl} me,you;
	}
	return 0;
}


