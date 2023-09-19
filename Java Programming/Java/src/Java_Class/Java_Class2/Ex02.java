package Java_Class.Java_Class2;

public class Ex02 {
    static int v1 = 10;

    public static void method1() {
        int v2 = 10;
        System.out.print(v1+" ");
        System.out.print(v2+" ");
    }

    public static void main(String[] args) {
        int v3 = 0;
        System.out.println(v1);
//		method1();
        //System.out.println(v2);
        System.out.println(v3);
        for (int v4 = 0; v4 < 5; v4++) {
            System.out.print(v4+" ");
        }
        //System.out.println(v4); //不能用v4在這裡
    }
}
