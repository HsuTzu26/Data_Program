package ntunhs_java_homework.S1;

import java.util.Scanner;

public class Star {

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {

        System.out.println("Please input one value to print the following statement.");

        int inp = input.nextInt();
        input.close();

        for (int i = 0; i <= inp; i++) {
            for (int j = 0; j <= i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }

        System.out.println("---------------");

        for (int i = inp; i >= 0; i--) {
            for (int j = i; j < inp; j++) {
                System.out.print(" ");
            }
            for (int k = inp; k > inp - i; k--) {
                System.out.print("*");
            }
            System.out.println();
        }

        System.out.println("---------------");

        int num = 1;

        for (int i = 1; i <= inp; i++) {
            for(int j = 1; j < i + 1; j++) {

                System.out.printf("%-4d" , num++);
            }
            System.out.println();
        }

        System.out.println("---------------");

        for (int i = 1, k = 1; i<= inp; i++) {
            for(int j = 1; j <= i; j++, k++) {

                System.out.print(k + " ");
            }

            System.out.println();
        }

    }
}
