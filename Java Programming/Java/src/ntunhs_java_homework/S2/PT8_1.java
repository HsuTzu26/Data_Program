package ntunhs_java_homework.S2;

import java.util.Scanner;
/*
大小寫轉換程式 (PT8_1.java)：
設計一個程式能輸入一串的英文字母，並將
其大寫的部份轉為小寫、小寫部份轉為大寫，
並且將字串反轉。
例如：
設定的字串為：Hello  Java
輸出的字串為：AVAj  OLLEh
*/

public class PT8_1 {

    public static void prln(String str) {
        System.out.println(str);
    }


    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        prln("請輸入一串英文字母");
        String inpStr = input.nextLine();
        StringBuffer sb = new StringBuffer();
        String str = "";

        if (inpStr != null) {
            for (int i = 0; i < inpStr.length(); i++) {
                char c = inpStr.charAt(i);
                if (Character.isUpperCase(c)) {
                    sb.append(Character.toLowerCase(c));
                } else if (Character.isLowerCase(c)) {
                    sb.append(Character.toUpperCase(c));
                }
            }
        }

        str = sb.reverse().toString();



        prln(str);

    }
}
