package Practice_HSU;

import java.util.Scanner;

public class LeastCommonMultiple {//LCM

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int arr[] = new int[2], i;

        System.out.println("Please input two value to find the least common multiple of them.");
        System.out.print("First: ");
        arr[0] = input.nextInt();
        System.out.print("Second: ");
        arr[1] = input.nextInt();

        for (i = 1; i <= arr[1]; i++) { //Using for loop to search the least common mutilple

            if (i * arr[1] % arr[0] == 0) {//Data comparison

                System.out.print("The result is: " + i * arr[1]);
                break;
            }
        }
    }
}
