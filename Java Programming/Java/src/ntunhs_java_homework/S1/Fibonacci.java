package ntunhs_java_homework.S1;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Fibonacci {
    private static long fib(long n) { //Recursion
        if (n == 0) return 0;
        if (n == 1 || n == 2) {

            return 1;

        } else {

            return fib(n - 1) + fib(n - 2);
        }
    }

    private static long fib_loop(int f) { //Loop
        if (f < 1) return 0;
        long num[] = new long[f];
        num[0] = 1;
        if (f > 1) {
            num[1] = 1;
            for (int i = 2; i < f; i++)
                num[i] = num[i - 1] + num[i - 2];
        }
        return num[f - 1];
    }

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {

        float golden_rate=0;
        long time1, time2,time3;

        time1 = System.currentTimeMillis();
        System.out.println("Please input one value to calculate Fibonacci function result.");
        //Recursion
        try {
            int inp = input.nextInt();

            System.out.print("Process: ");
            for (int i = 0; i <= inp; i++) {
                System.out.print(fib(i) + " ");
            }
            System.out.println("\n" + "The result is: " + fib(inp));
            time2 = System.currentTimeMillis();
            System.out.println("Time cost: " + (time2 - time1)/1000 + "sec");

            golden_rate = (float) fib(inp) / (float) fib(inp-1);

            System.out.println();
            System.out.printf("Golden rate is: %1.5f", golden_rate);

        } catch (InputMismatchException ex) {
            System.out.print("Please input right value.");
        }

        System.out.println();

        System.out.println("Please input one value to calculate Fibonacci function result.");

        //for loop
        try {
            int inp = input.nextInt();

            System.out.print("Process: ");
            for (int i = 0; i <= inp; i++) {
                System.out.print(fib_loop(i) + " ");
            }

            System.out.println("\n" + "The result is: " + fib_loop(inp));

            time3 = System.currentTimeMillis();
            System.out.println("Time cost: " + (time3 - time1)/1000 + "sec");

            golden_rate = (float) fib(inp) / (float) fib(inp-1);

            System.out.println();
            System.out.printf("Golden rate is: %1.5f", golden_rate);
        } catch (InputMismatchException ex) {
            System.out.print("Please input right value.");
        }



//        if((time3 - time1)/1000 > (time2 - time1)/1000) System.out.println("Recursion costs more.");
//        else if((time3 - time1)/1000 < (time2 - time1)/1000) System.out.println("For loop costs more.");

//        int inp = input.nextInt();
//        int fn = 0;
//        int fn_1 =0, fn_2= 1;
//
//        for (int i = 2;i<=inp;i++){
//            fn = fn_1 + fn_2; System.out.print(fn+" ");
//            fn_1 = fn_2;
//            fn_2 = fn;
//        }


    }
}
