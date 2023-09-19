package Java_Class.Java_Class2;

public class Ex01 { //class name is Ex01
    // v1 是 Ex01的成員變數, 範圍最廣
    static int v1 = 0;

    static void method() {
        // v2 是 method 函式的區域變數
        int v2 = 0;
        v1++;
    }

    static void method2() {
        // v3 是 method2 函式的區域變數
        int v3 = 0;
        int v1=0;
        for (int i = 0; i < 10; i++) {
            // i 是 for loop 的區域變數
            // 其它的程式碼
            v3++;
        }
        //v2++; 不能在這裡用v2
    }

    //main 程式的起始點
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        // v4 是 main 函式的區域變數
        int v4 = 0;
        int v1=10;
        // 其它的程式碼
        // i++;
        v1++; //可以用到 v1，注意是藍色
        System.out.print("v1="+v1+" ");
    }
}

