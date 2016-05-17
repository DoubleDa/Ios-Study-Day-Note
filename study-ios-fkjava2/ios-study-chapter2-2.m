#import <Foundation/Foundation.h>
#define NO_CHESS "+"
#define BLACK_CHESS "*"
#define WHITE_CHESS "o"
#define BOARD_SIZE 15

//棋盘
static char *board[BOARD_SIZE][BOARD_SIZE];
//初始化棋盘
void initBoard(){
	for(int i=0;i<BOARD_SIZE;i++){
		for(int j=0;j<BOARD_SIZE;j++){
			board[i][j]=NO_CHESS;
		}
	}
}

void printBoard(){
	for(int i=0;i<BOARD_SIZE;i++){
		for(int j=0;j<BOARD_SIZE;j++){
			printf("%s",board[i][j]);
		}
		printf("\n");
	}
}

int main(int argc, char *argv[])
{
	@autoreleasepool{
		initBoard();
		printBoard();
		while(YES){
			int xPos;
			int yPos;
			printf("请输入要下棋子的坐标：\n");
			scanf("%d,%d",&xPos,&yPos);
			board[xPos-1][yPos-1]=BLACK_CHESS;

			int pcX=arc4random()%BOARD_SIZE;
			int pcY=arc4random()%BOARD_SIZE;
			board[pcX][pcY]=WHITE_CHESS;

			printBoard();

		}
	}
	
	return 0;
}
