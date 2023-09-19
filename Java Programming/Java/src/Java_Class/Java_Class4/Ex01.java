package Java_Class.Java_Class4;

//import java.util.Arrays;
import java.util.*;
public class Ex01 {
    public static void main(String[] args) {
        char[] Array1 = { 'A', 'B', 'C', 'D', 'E', 'F' };
        // char[] Array1 = new char[]{ 'A', 'B', 'C', 'D', 'E', 'F' };
        char[] Array2 = { 'A', 'B', 'C', 'D', 'E' };
        char[] Array3 = { 'A', 'B', 'C', 'D', 'E', 'F' };

        char[] Array4 = Array1;

        System.out.println("Array1和Array2的內容(address)相同嗎 " + (Array1 == Array2));
        System.out.println("Array1和Array3的內容(address)相同嗎 " + (Array1 == Array3));
        System.out.println("Array1和Array4的內容(address)相同嗎 " + (Array1 == Array4));
        System.out.println("===================================");

        System.out.print("更新前 Array1:");
        ArrayTools.printChar(Array1);
        System.out.print("更新前 Array4:");
        ArrayTools.printChar(Array4);
        Array4[2] = 'Z';

        System.out.print("更新後 Array1:");
        ArrayTools.printChar(Array1);
        System.out.print("更新後 Array4:");
        ArrayTools.printChar(Array4);

        System.out.println("===================================");

        // 如果要判斷兩個陣列的內容是否相同
        // 不用Arrays類別的作法
        boolean flag = true;
        if (Array1.length != Array3.length) {
            flag = false;
        } else { // Array1.length == Array3.length
            for (int i = 0; i < Array1.length; i++) {
                if (Array1[i] != Array3[i]) {
                    flag = false;
                    break;
                }
            }
        }
        if (flag) {
            System.out.println("Array1和Array3的內容完全相同");
        } else {
            System.out.println("Array1和Array3的內容不完全相同");
        }
        System.out.println("===================================");

        // 如果要判斷兩個陣列的內容是否相同
        // 使用Arrays類別中euqals的作法
        // java.util.Arrays
        flag = Arrays.equals(Array1, Array3);
        if (flag) {
            System.out.println("Array1和Array3的內容完全相同");
        } else {
            System.out.println("Array1和Array3的內容不完全相同");
        }

        System.out.println("===================================");
        int[] array1 = {1,2,3,4,5};
        int[] array2 = {1,2,3,4,5};
        flag = Arrays.equals(array1, array2);
        if (flag) {
            System.out.println("array1和array3的內容完全相同");
        } else {
            System.out.println("array1和array3的內容不完全相同");
        }
    }

}
