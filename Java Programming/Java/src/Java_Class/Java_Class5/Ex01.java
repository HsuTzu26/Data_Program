package Java_Class.Java_Class5;

import java.util.*;
public class Ex01 {

    public static void main(String[] args) {
        System.out.println("-5 的絕對值是：" + Math.abs(-5));
        System.out.println("1.2, 3.4 比較大的是：" + Math.max(1.2, 3.4));
        System.out.println("2, 5 比較小的是：" + Math.min(2, 5));
        System.out.println("2 的 3 次方是：" + Math.pow(2, 3));
        System.out.println("9 開根號之後是：" + Math.sqrt(9));
        System.out.println("3.7 四捨五入之後是：" + Math.round(3.7));
        System.out.println("3.2 無條件進位後是：" + Math.ceil(3.2));
        System.out.println("3.8 無條件捨去後是：" + Math.floor(3.8));

        // create random object
        Random randomno = new Random();
        // setting seed
        randomno.setSeed(101);
        // value after setting seed

        System.out.println("Object after seed");
        for (int j = 0; j < 5; j++) {
            System.out.print(randomno.nextInt(100)+" ");
        }

        System.out.println();
        System.out.println("generate a random number每一次不同：" + Math.random());
    }

}

