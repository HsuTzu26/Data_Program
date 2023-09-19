package Java_Class.Ex;

public class Ex13 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        int i = 1, sum = 0;

        do {
            sum = sum + i;
            System.out.println("執行ing：i = " + i + " ，sum = " + sum);
            i++; // 迴圈控制變數值的增加
        } while (i <= 10); // 若 i 的初始值改成 11 會如何?

        System.out.println("執行後：i = " + i + " ，sum = " + sum);

    }

}
