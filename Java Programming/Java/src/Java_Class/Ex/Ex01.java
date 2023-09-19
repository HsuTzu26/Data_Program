package Java_Class.Ex;

public class Ex01 {

    public static void main(String[] args) {

        int age = 18;

        /* if (boolean) 括號內只能放 boolean 資料型態
         * <  表示小於
         * <= 表示小於等於
         * == 表示等於
         * != 表示不等於
         * >= 表示大於等於
         * >  表示大於
         */

        if (age >= 18) {
            System.out.println("成年");
        }
        if (age < 18) {
            System.out.println("未成年");
        }
        if (age == 18) {
            System.out.println("剛好成年");
        }
        System.out.println("程式結束");
    }

}

