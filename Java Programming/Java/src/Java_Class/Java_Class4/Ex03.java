package Java_Class.Java_Class4;

import java.util.*;

public class Ex03 {

    public static void main(String[] args) {

        int[] Array1 = new int[] { 58, 1, 50, 23, 55, 78, 19, 3, 9, 29 };
        int[] Array2 = new int[Array1.length];

        // 顯示陣列Array1的內容
        System.out.println("Array1的內容：");
        ArrayTools.print(Array1);

        // 使用 System.arraycopy
        System.arraycopy(Array1, 0, Array2, 0, Array1.length);

        // 顯示陣列arrTwo的內容
        System.out.println("Array2的內容：");
        ArrayTools.print(Array2);

        // 使用 Arrays.copyOf
        //int[] Array3 = new int [15];
        int[] Array3 = Arrays.copyOf(Array1, Array1.length+2);
        System.out.println("Array3的內容："+Array3.length);
        ArrayTools.print(Array3);

        int[] Array4 = Arrays.copyOf(Array1, Array1.length-2);
        System.out.println("Array3的內容："+Array4.length);
        ArrayTools.print(Array4);

    }

}

