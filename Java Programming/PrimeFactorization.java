package Practice_HSU;

import java.util.Scanner;

public class PrimeFactorization {

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int inp, i;

        System.out.println("Please input one value to find its prime factorization.");
        inp = input.nextInt();

        System.out.print("The result is: "+ inp + "= ");

        for (i = 2; i <= inp; i++) {
            while (inp != i) {
                if (inp % i == 0) {
                    System.out.print(i + "*");
                    inp /= i;
                } else break;
            }
        }
        System.out.print(inp);

        //Find all the prime factorization in this area.

        System.out.println("\n" + "Please input two value to find all the prime factorization in this area.");
        int arr[] = new int[2], j, k;


        System.out.print("First: ");
        arr[0] = input.nextInt();
        System.out.print("Second: ");
        arr[1] = input.nextInt();

        while (arr[1] > arr[0]) {
            System.out.println("The result is: ");

            for (i = arr[0]; i <= arr[1]; i++) {
                if (i >= 3) {
                    String m = "";
                    k = 2;
                    j = i;

                    while (j != k) {
                      //如果input > k，但input能被k整除，則應打印出k的值，並用input除以k的商作為新的正整數n
                        if (j % k == 0) {
                            m += k + "*";
                            j = j / k;
                        } else if (j % k != 0) {
                            // 如果input不能被k整除，則用k+1作為k的值
                            k++;
                        }
                    }
                    m += k;
                    System.out.println(i + "= " + m);
                } else System.out.println(i + "= " + i);

            }
            break;
        }
        if (arr[1] < arr[0]) System.out.print("Not satisfied topic.");

    }
}
