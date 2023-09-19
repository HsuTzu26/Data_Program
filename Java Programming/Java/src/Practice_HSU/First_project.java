package Practice_HSU;

import java.util.*;

public class First_project { //Simple Addition, when the user input value, the program will print the process, finally it'll print the result.

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int i;
        int j = 0;
        int x[] = new int[3];

        while (true) {
            try {
                for (i = 0; i < 2; i++) {
                    System.out.print("Input" + (i + 1) + ": ");
                    x[i] = input.nextInt();
//                    System.out.println("Output: " + x[i]);
                    j += 1;
                    if (i == 1) {
                        x[j] = x[j - 1] + x[j - 2];

                        System.out.print("Process: " + x[j - 1] + " + " + x[j - 2] + " = " + x[j]);
//                        System.out.print("Value: " + x[j]);
                    }
                }
            } catch (InputMismatchException ex) {

                System.out.print("Please input right value !!");
            }
            break;
        }

    }
}
