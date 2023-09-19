package Java_Class.Java_Class5;

public class Ex02 {

    public static void main(String[] args) {
        System.out.println("開始擲骰子------");
        int[] point=new int[] {0,0,0,0};
        for (int i = 1; i <= 4; i++) {
            int result = getPoint(6);
            System.out.println("第 " + i + " 顆骰子的點數是：" + result);
        }
        System.out.println("骰子投擲完畢----");

    }

    public static int getPoint() {
        int ret = 0;
        // 先放大6倍，去掉小數點，然後再向右位移1
        ret = (int)(Math.floor(Math.random() * 6) + 1);
        return ret;
    }

    public static int getPoint(int x) {
        int ret = 0;
        // 先放大6倍，去掉小數點，然後再向右位移1
        ret = (int)(Math.floor(Math.random() * x) + 1);
        return ret;
    }
}

