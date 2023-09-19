package ntunhs_java_homework.S1;

import java.util.Scanner;

public class Prime_Number {

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int inp, i, n, times = 3;
        boolean judge = true, end = false;

        System.out.println("Please input one number to judge whether is prime number or not.");

//        while (times <= 3) {
//            if (end) break;
//            try {
//                inp = input.nextInt();
//
//                if (inp == 1 || inp < 1) {
//                    System.out.print("Input not satisfied topic." + "\n" + "Please input again");
//                    times--;
//                    System.out.println("You have " + times + " chances left.");
//                    if (times == 1) {
//                        System.out.println("You only have " + times + " chance left.");
//                    } else if (times == 0) {
//                        System.out.print("Unfortunately, you have no chance to input.");
//                        break;
//                    }
//                }
        inp = input.nextInt();
                //Judge the input whether is prime number or not
                //while (inp >= 2) {
                    for (i = 2; i <= Math.sqrt(inp); i++) {
                        judge = true;

                        if (inp % i == 0) {
                            judge = false;
                            break;
                        }
                    }
                    if (judge) {
                        System.out.println("This value is Prime Number.");
                    } else {
                        System.out.println("This value isn't Prime Number");
                    }
//                    System.out.println("Show the all Prime Number: ");
//                    for (i = 2; i <= inp; i++) { //Find all the prime number in range.
//                        judge = true;
//                        for (n = 2; n <= Math.sqrt(i); n++) {
//                            if (i % n == 0) {
//                                judge = false;
//                                break;
//                            }
//                        }
//                        if (judge) System.out.print(i + " ");
//                    }
//                    inp = 0;
//                    end = true;
              //  }
//            } catch (InputMismatchException ex) {
//                System.out.print("Please Input right value.");
//                break;
//            }
        }
    }
//}