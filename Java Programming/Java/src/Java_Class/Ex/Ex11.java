package Java_Class.Ex;

public class Ex11 {

    /**
     * @param args
     */

    public static void main(String[] args) {

        for (int i = 0; i < 10; i += 2) {// 宣告 i 在for 迴圈中
            System.out.print(i + " ");   // 出了 for 迴圈，i 就無效了
        }

        //System.out.println(i); //這行程式會產生編譯錯誤，i 只在for 迴圈中

    }

}
