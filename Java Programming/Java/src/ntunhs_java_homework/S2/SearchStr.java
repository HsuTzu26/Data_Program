package ntunhs_java_homework.S2;

import java.util.Scanner;

public class SearchStr {

    private static final Scanner SCANNER = new Scanner(System.in);
    public static void main(String[] args) {
        String str1 = "Time and tide waits for no man. "
                + "Time and tide waits for no person."
                + "It is true that Time and tide waits for no one.";
        System.out.println("原自串: " + str1);
        System.out.println("請輸入要尋找的字串: ");
        String findStr = SCANNER.nextLine();
        System.out.println("請輸入要替代的字串: ");
        String replaceStr = SCANNER.nextLine();

        SCANNER.close();

        int index = 0;
        boolean findOrNot = false;

        for (int i = 0; i < str1.length(); i++) {

            if (index != -1) {findOrNot = true; }
            else{  System.out.println("您所要尋找的字串找不到！"); break;}
            if (findOrNot) {
                index = str1.indexOf(findStr, index + 1);
                if (index == -1) {
                    break;
                }
                System.out.println("第" + (i + 1) + "次找到的索引值: " + index);
            }
        }

        str1 = str1.replace(findStr, replaceStr);

        System.out.println("新字串: " + str1 );


    }
}
