package ntunhs_java_homework.S2;

import java.util.Scanner;

public class TriangleArea {

    static int cul_Triangle_Area(int x, int y) {
        int area = x * y / 2;
        return area;
    }

    static void prln(String str){
        System.out.println(str);
    }

    static void pr(String str){
        System.out.print(str);
    }

    private static final Scanner input = new Scanner(System.in);
    public static void main(String[]args){
        int[] arr_inp = new int[5]; int count=0;
        prln("*** Calculate Triangle Area ***");
        pr("Bottom: ");
        arr_inp[count] = input.nextInt();
        count++;
        pr("Height: ");
        arr_inp[count] = input.nextInt();
        System.out.print("Triangle Area is: " +
                cul_Triangle_Area(arr_inp[count-1],arr_inp[count]));
    }
}
