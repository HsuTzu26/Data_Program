package ntunhs_java_homework.S2;

import java.util.Scanner;
/*
加密程式 (PT8_2.java)：
設計一個加密程式，步驟如下：
將輸入的英文字元轉換成下一個字元順序的字元
例如： 輸入a，輸出b。
轉換完成後，再將字串反轉輸出
範例：
輸入「Hello」會得到「Ifmmp」，
反向後輸出為「pmmfI 」
*/
public class The_StrKey {

    private static final Scanner SCANNER = new Scanner(System.in);

    public static void main(String[]args) {
        System.out.println("請輸入一個字串");

        String inpStr = SCANNER.nextLine();
        char [] chStr = inpStr.toCharArray();
        StringBuffer sb = new StringBuffer(inpStr.length());
        String str = "";

        for (int i = 0; i < inpStr.length(); i++) {
            if(chStr[i] == 'z') {
                sb.append('a');
            } else if (chStr[i] == 'Z') {
                sb.append('A');
            } else {
                chStr[i] = (char) (chStr[i] + 1);
                sb.append(chStr[i]);
            }

        }
        str = sb.reverse().toString();

        System.out.println("加密過後");
        System.out.println(str);
        System.out.println("解密過後");
        String newStr = solve(str);
        System.out.print(newStr);
    }
    /*
    解密程式 (HW8.java)：
    設計一個能將 PT8_2.java 加密過的字串解密回
    原始字串的解密程式
     */
    
    public static String solve(String str) {
        char []newchStr = str.toCharArray();
        StringBuffer newsb = new StringBuffer(str.length());

        for(int i = 0; i < str.length(); i++) {
            if(newchStr[i] == 'a') {
                newsb.append('z');
            } else if (newchStr[i] == 'A') {
                newsb.append('Z');
            } else {
                newchStr[i] = (char) (newchStr[i] - 1);
                newsb.append(newchStr[i]);
            }
        }

        String newStr = newsb.reverse().toString();

        return newStr;
    }
}
