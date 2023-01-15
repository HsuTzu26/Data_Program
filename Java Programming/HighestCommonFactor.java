package Practice_HSU;

import java.util.Scanner;

public class HighestCommonFactor {//HCF, also known as greatest common divisor(abbr. GCD).

    private static int hcf(int x, int y) { //Recursion 輾轉相除遞迴法

        if (y == 0) {
            return x;
        } else {
            return hcf(y, x % y);
        }
    }

    private static int hcf_loop(int m, int n){//Loop 輾轉相除迴圈法
        int temp = 0;

        while(n!= 0){
            temp = m % n;
            m = n;
            n = temp;
        }
        return m;
    }

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int arr[] = new int[2], i;

        System.out.println("Please input two value to find the highest common factor of them.");
        System.out.print("First: ");
        arr[0] = input.nextInt();
        System.out.print("Second: ");
        arr[1] = input.nextInt();

        input.close();

        System.out.println("The result is: " + hcf(arr[0], arr[1]) + " ");

        System.out.print("The result is: " + hcf_loop(arr[0], arr[1]) + " ");
    }
}
