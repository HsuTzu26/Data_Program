package Java_Class.Java_Class2;

public class Ex04 {

    public static void main(String[] args) {

        if (args.length != 1) {
            System.out.println("請輸入一個數字");
            System.exit(1);
        }
        // Double.parseDouble 是將 字串 轉成 浮點數
        double r = Double.parseDouble(args[0]);
        System.out.println("輸入的半徑為：" + r);

        double area = CArea(r);
        System.out.println("圓的面積為：" + area);

    }

    public static double CArea(double r) {
        double ret;

        // 求圓面積=半徑*半徑*3.14
        ret = r * r * 3.14;

        return ret;
    }

}
