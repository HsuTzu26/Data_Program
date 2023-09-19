package ntunhs_java_homework.S2;

import java.nio.MappedByteBuffer;
import java.util.Scanner;
import java.util.zip.CheckedInputStream;

import javax.swing.text.BadLocationException;

class account {
    String NAME = "Hsu";
    String ID = "1";
    String PWD = "1";
    int balance = 5000;

    int login(String gID, String gPWD) {
        if (!ID.equals(gID)) {
            return 1;// 帳號NO
        }
        if (!PWD.equals(gPWD)) {
            return 2;// 密碼NO
        }
        return 0;// 都對
    }

    int deposit(int input) {
        balance = balance + input;
        return 0;
    }

    int wiithdraw(int input) {
        balance = balance - input;
        return balance;

    }

    int checkbalance() {
        return balance;

    }

}

public class ATM {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Scanner choiceScanner = new Scanner(System.in);
        // 1. 如果輸入錯誤三次就離開
        int result = 0;
        int inCount = 0;
        account myaccount = new account();

        while (true) {
            System.out.println("歡迎光臨CY-ATM 請輸入帳號");
            String myID = scanner.nextLine();
            System.out.println("歡迎光臨CY-ATM 請輸入密碼");
            String myPWD = scanner.nextLine();

            result = myaccount.login(myID, myPWD);

            if (result == 0) {
                System.out.println("歡迎光臨! " + myaccount.NAME + "\n");
                break;
            }

            else {
                inCount++;
                if (result == 1) {
                    System.out.println("帳號不存在\n");
                }
                if (result == 2) {
                    System.out.println("密碼錯誤\n");
                }

            }
            System.out.println("輸入錯誤，你還剩 " + Integer.toString(3 - inCount) + "次");

            if (inCount > 2) {
                System.out.println("輸入超過三次! BYE");
                break;
            }
        }

        if (inCount < 2) {

            // 3. 若沒有輸入4，請重複主畫面的步驟

            // 2. 完成輸入選項的case condition。可用if-else or switch語法
            while (true) {
                System.out.println("請輸入選項 (1)查詢餘額 (2)存款 (3)提款 (e)離開");

                String choice = choiceScanner.nextLine();

                if (choice.equals("1")) {
                    System.out.println("您的餘額:" + myaccount.checkbalance());

                } else if (choice.equals("2")) {
                    System.out.println("請輸入存款金額");
                    int input = scanner.nextInt();
                    myaccount.deposit(input);
                    System.out.println("存款成功，存入:" + input + "， 餘額" + myaccount.balance);

                } else if (choice.equals("3")) {
                    System.out.println("請輸入提款金額");
                    int input = scanner.nextInt();
                    myaccount.wiithdraw(input);
                    System.out.println("提款成功，提出:" + input + "， 餘額" + myaccount.balance);
                } else if (choice.equalsIgnoreCase("e")) {
                    System.out.println("BYE");
                    break;
                }

            }
        }
        scanner.close();
    }
}
