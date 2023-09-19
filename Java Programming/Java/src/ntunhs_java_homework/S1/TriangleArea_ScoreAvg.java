package ntunhs_java_homework.S1;

import java.util.Scanner;

public class TriangleArea_ScoreAvg {

    static int  cul_Triangle_Area(int x, int y){
        int area = x*y / 2;
        return area;
    }
    static int cul_Score_Summary(int x, int y ,int z){
        int i = x + y + z;
        return i;
    }
    static int cul_Avg(int x, int y ,int z){
        int avg = (x + y + z) / 3;
        return avg;
    }


    private static final Scanner input = new Scanner(System.in);
    public static void main (String[]args){
        int[] arr_inp = new int[5]; int count=0;
        System.out.println("*** Calculate Triangle Area *** ");
        System.out.print("Bottom: ");
        arr_inp[count] = input.nextInt();
        count++;
        System.out.print("Height: ");
        arr_inp[count] = input.nextInt();
        System.out.println( "Triangle Area is: "+ cul_Triangle_Area(arr_inp[count-1],arr_inp[count]));
        count++;
        System.out.println("*** Culculate Score *** ");
        System.out.print("Chinese : ");
        arr_inp[count] = input.nextInt();
        count++;
        System.out.print("English : ");
        arr_inp[count] = input.nextInt();
        count++;
        System.out.print("Mathematic : ");
        arr_inp[count] = input.nextInt();
        System.out.println( "Score Summary is: "+ cul_Score_Summary(arr_inp[count-2],arr_inp[count-1],arr_inp[count]));
        System.out.println("Score Average is: " + cul_Avg(arr_inp[count-2],arr_inp[count-1],arr_inp[count]));
        System.out.print("*** The END *** ");
















//        int i;
//        int j = 0;
//        int x[] = new int[3];
//
//        while (true){
//            try {
//                for (i = 0; i < 2; i++) {
//                    System.out.print("Input" + (i + 1) + ": ");
//                    x[i] = input.nextInt();
//                    System.out.println("Output: " + x[i]);
//                    j += 1;
//                    if (i == 1) {
//                        x[j] = x[j - 1] + x[j - 2];
//                        System.out.print("Value: " + x[j]);
//                    }
//                }
//            }catch(InputMismatchException ex){
//
//                System.out.print("Please input right value !!");
//            }
//            break;
//        }

    }
}
