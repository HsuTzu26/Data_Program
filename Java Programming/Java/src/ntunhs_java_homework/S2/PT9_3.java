package ntunhs_java_homework.S2;

import java.util.InputMismatchException;
import java.util.Scanner;

class Student extends Person {

    Student(String name) {
        super(name);
    }

    Scanner scanner = new Scanner(System.in);

    int chinese = scanner.nextInt();
    int english = scanner.nextInt();
    int math = scanner.nextInt();

    int getSum(){
//        chinese = 50;
//        english = 50;
//        math = 50;
        int sum = chinese + english + math;
        return sum;
    }

    double getAverage(){
        int sum = getSum();
        double average = ((double)(sum)) / 3;
        return average;
    }
}

public class PT9_3 {

    public static void main(String[]args) {

        try {
            System.out.println("請輸入國文、英文、數學三科成績:");
            Student st = new Student("Hsu");
            System.out.println("總和: " + st.getSum());
            System.out.printf("平均: %3.2f", st.getAverage());
        } catch (InputMismatchException ex) {
            System.out.println("必須輸入整數");
        }
    }
}
