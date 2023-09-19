package Java_Class.Ex;

public class Ex14 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        // 九九乘法表
        for (int i = 1; i <= 9; i++) { // 注意執行後，i的值
            for (int j = 1; j <= 9; j++) {
                System.out.print(i + "*" + j + "=" + i * j + "\t");
            }
            System.out.println();
        }
        System.out.println("程式執行完畢");

    }

}
