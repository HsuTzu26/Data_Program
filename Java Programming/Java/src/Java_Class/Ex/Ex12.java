package Java_Class.Ex;

public class Ex12 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        int i = 0, sum = 0;
        int n=10;

        while (i <= n) {
            sum = sum + i;
            System.out.println("執行ing：i = " + i + " ，sum = " + sum);
            i++; // 迴圈控制變數值的增加
        }
        System.out.println("執行後：i = " + i + " ，sum = " + sum);

    }

}
