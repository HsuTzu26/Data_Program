package ntunhs_java_homework.S2;

/*
類別修改練習 (PT9_1.java)
請修改 Counter 類別
在執行 decrementCount  的時候不會使出現負值。
請修改 Counter 類別的建構子，
可以讓使用者指定 Counter 的初始值
*/

public class CounterTest {

    public static void main(String[]args) {

        System.out.println("請設定Counter初始值:");
        Counter incre, decre;
        System.out.print("第一個: ");
        incre = new Counter();
        System.out.print("第二個: ");
        decre = new Counter();

        incre.incrementCount();
        decre.decrementCount();

        System.out.println("Increment Count: " + incre.getCount());
        System.out.println("Decrement Count: " + decre.getCount());

        incre.setCount();
        System.out.println("After SetCount:"); //Set 0
        System.out.println("Get Count: " + incre.getCount());
    }
}
