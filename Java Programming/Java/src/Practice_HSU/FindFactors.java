package Practice_HSU;

import java.util.Scanner;

public class FindFactors {

    private static int find(int x) {
        return 0;
    }


    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int inp, count = 0;

        System.out.println("Please input one value to find its factors.");
        inp = input.nextInt();

        System.out.println("The result is: ");
        int i;
        for (i = 1; i < (inp / 2) + 1; i++) {

            if (inp % i == 0) {
                if(inp < 100)System.out.print(i + " " + "\t");
                else System.out.print(i + " ");
                count++;
                if (count % 5 ==0) System.out.println();
            }
        }
        System.out.print(inp);
    }
}
