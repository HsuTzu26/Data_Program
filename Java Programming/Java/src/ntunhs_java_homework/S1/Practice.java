package ntunhs_java_homework.S1;

import java.util.Scanner;

public class Practice {
    private static final Scanner input = new Scanner (System.in);


    public static void main (String[]args) {
        System.out.println("Please input one value to stand for radius");

        System.out.print("Integer: ");
        int r = input.nextInt();

        System.out.print("Double: ");
        double r2 = input.nextDouble();

        input.close();

        System.out.println("Integer");
        System.out.println("The circle area: " + myCIR.CirArea(r) + "cm2");
        System.out.println("The circle surround: " + myCIR.CirCum(r) + "cm");

        System.out.println();
        System.out.println("Double");

        System.out.println("The circle area: " + myCIR.CirArea(r2) + "cm2");
        System.out.println("The circle surround: " + myCIR.CirCum(r2) + "cm");

    }
}
