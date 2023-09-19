package Java_Class.Java_Class2;

import java.util.Scanner; // scanner is reference data type

//https://yubin551.gitbook.io/java-note/basic_java_programming/standard_input_scanner
public class HW3_3 {

    public static void main(String[] args) {
        //System.out.println("求 1!+2!+3!+…+20! 的結果");

        System.out.println("請輸入n:");
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        in.close();

        //int n = 10;
        long sum = 0; //note that int is too short for storing the value
        for (int i=1; i<= n; i++){
            long value = 1; //find i!
            for (int j=1; j<=i; j++){
                //value = value*j;
                value *= j;
            }
            System.out.println(i+"!="+value);
            //sum = sum + value;
            sum += value;
        }

        System.out.println("1!+2!+...+"+ n +"! = "+ sum);
    }

}
