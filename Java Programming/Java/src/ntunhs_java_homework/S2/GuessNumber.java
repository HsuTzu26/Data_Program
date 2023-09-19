package ntunhs_java_homework.S2;

import java.util.Random;
import java.util.Scanner;

public class GuessNumber {
    Random random = new Random();
    private int answer; //存正解
    private static final Scanner SCANNER = new Scanner(System.in);

    public GuessNumber() {//隨機產生1~100的數字當解答
        answer = random.nextInt(100)+1;
    }
//     answer = (int) (Math.floor(Math.random()*100+1);

    public int judge(int inputNum){
            int judgeNum = 0;
            if (answer == inputNum) {
                judgeNum = 0;
                System.out.println("BINGO! Congratulation! " + judgeNum);
                System.exit(0);
            } else if (answer > inputNum) {
                judgeNum = -1;
                System.out.println("輸入的數字太小囉！ " + judgeNum);
            } else if (answer < inputNum) {
                judgeNum = 1;
                System.out.println("輸入的數字太大囉！ " + judgeNum);
            }
            return judgeNum;
    }
    //輸入一個數字,若正確傳回0
    //若輸入的數字太小, 則傳回 -1
    //若輸入的數字太大, 則傳回 1

    public int getAnswer(){
        return answer;
    }
    //回傳答案

    public void run(){
//        while(true){
            int input = SCANNER.nextInt();
            judge(input);
//        }
    }

}
