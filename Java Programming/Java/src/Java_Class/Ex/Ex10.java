package Java_Class.Ex;

public class Ex10 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        int i = 0; // 需要先初始化 i 的值

        for (; i < 10; i += 2) { // 迴圈敘述中省略了變數初始設定的區塊
            System.out.println("執行時：i = " + i); // 觀察 i 值的變化
        }

        System.out.println("***執行後：i = " + i);
    }

}
