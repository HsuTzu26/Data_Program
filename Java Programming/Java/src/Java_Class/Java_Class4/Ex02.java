package Java_Class.Java_Class4;

import java.util.*;

public class Ex02 {

    public static void main(String[] args) {
        int[] sort = { 3, 5, 1, 8, 9, 7, 4 };
        char[] array1 = { 'X', 'B', 'K', 'D', 'P', 'F' };
        String[] s1 = {"Ax","Nc", "DB", "Fk", "Ej"};
		/*
		Integer[] arr={56,32,67,32,66,31,75,49,32,56};
        Arrays.sort(arr, Collections.reverseOrder());

    		for (int i = 0; i < arr.length; i++) {
    			System.out.print(arr[i] + "\t");
    		}
    		System.out.println();

        */

        System.out.println("使用 Arrays.sort() for int");
        ArrayTools.print(sort); // 顯示陣列的內容
        Arrays.sort(sort); // 將array做遞增排序
        ArrayTools.print(sort); // 顯示陣列的內容

        System.out.println("使用 Arrays.sort() for char");
        ArrayTools.printChar(array1); // 顯示陣列的內容
        Arrays.sort(array1); // 將array做遞增排序
        ArrayTools.printChar(array1); // 顯示陣列的內容

        System.out.println("使用 Arrays.sort() for String");
        ArrayTools.printStr(s1); // 顯示陣列的內容
        Arrays.sort(s1); // 將array做遞增排序
        ArrayTools.printStr(s1); // 顯示陣列的內容

        System.out.println("=====================");
        System.out.println("不使用 Arrays.sort()");

        sort = new int[] { 3, 5, 1, 8, 10, 7, 4 }; // 重新定義一個相同的陣列

        ArrayTools.print(sort); // 顯示陣列的內容

        // 不使用Arrays.sort()來排序陣列的內容
        for (int i = 0; i < sort.length - 1; i++) {
            // 此從 i到 length-1 中，找最小元素的 min_idx
            int min = sort[i];
            int min_idx = i;
            for (int j = i + 1; j < sort.length; j++) {
                if (sort[j] < min) { // 改成「<」就是由大排到小了
                    min = sort[j];
                    min_idx = j;
                }
            }
            // 將最小的元素(min_idx)和第i個元素交換 (每次可確保第i個一定最小的)
            int tmp = sort[min_idx];
            sort[min_idx] = sort[i];
            sort[i] = tmp;
        }

        ArrayTools.print(sort); // 顯示陣列的內容

        System.out.println("=====================");
        sort = new int[] { 3, 5, 1, 8, 10, 7, 4 };
        ArrayTools.print(sort); // 顯示陣列的內容
        ArrayTools.sort(sort);
        ArrayTools.print(sort); // 顯示陣列的內容

        System.out.println("=====================");
        sort = new int[] { 3, 5, 1, 8, 10, 7, 4 };
        ArrayTools.print(sort); // 顯示陣列的內容
        ArrayTools.reverse_sort(sort);
        ArrayTools.print(sort); // 顯示陣列的內容
    }
}
