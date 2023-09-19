package Java_Class.Java_Class2;

public class Ex03 {
    static int v1 = 0; // v1 是 Ex03的成員變數, 範圍最廣
    public static void method1() {
        int v2 = 0;
    }

    public static void main(String[] args) {
        int v1 = 10;
        int v2 = 10;
        //int v3 = 0;
        System.out.println("v1 = " + v1); // 同名，以local 變數優先
        System.out.println("class v1="+ ++Ex03.v1); //這樣可以用到 Ex03 的 v1
        System.out.println("class v1="+ v1);

    }
}
