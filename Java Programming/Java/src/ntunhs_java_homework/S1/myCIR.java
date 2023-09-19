package ntunhs_java_homework.S1;

public class myCIR {

    /**
     * 使用者輸入半徑後自動計算圓面積回傳
     * @param r 半徑
     * @return 圓面積
     */

    public static double CirArea(int r) {
        double area = r * r * 3.14;

        return area;
    }


    /**
     * 使用者輸入半徑後自動計算圓周長回傳
     * @param r 半徑
     * @return 圓周長
     */

    public static double CirArea(double r) {
        double area = r * r * Math.PI;

        return area;
    }

    public static double CirCum(int r) {
        double circum = 2 * r * 3.14;

        return circum;
    }

    public static double CirCum(double r) {
        double circum = 2 * r * Math.PI;

        return circum;
    }


}

