package ntunhs_java_homework.S2;

import java.util.InputMismatchException;
import java.util.Scanner;

class Student2 extends Person2{

    private int chinese;
    private int english;
    private int math;

    public Student2()
    {
        this.name = "Arthur";
        this.chinese = 0;
        this.english = 0;
        this.math = 0;
    }

    public Student2 (String name, int chinese, int english, int math)
    {
        this.name = name;
        this.chinese = chinese;
        this.english = english;
        this.math = math;
    }


    public Student2 (String name, int chinese, int english, String math)
    {
            this.name = name;
        this.chinese = chinese;
        this.english = english;
        try {
            this.math = Integer.parseInt(math);

        } catch (java.lang.NumberFormatException e) {
            System.out.println("Exception: " + e.getMessage());
            System.out.println("chinese set to 0");
            this.math = 0;
        }
        finally {
            System.out.println("執行到finally！");
        }
        System.out.println("執行完畢！");
    }


    public int getSum() {
        return this.chinese + this.english + this.math;
    }

    public double getAverage() {
        int sum = getSum();
        double avg = sum / 3.0;

        return avg;
    }

    @Override
    public String toString() {
        String ret = "";
        ret = ret+"\n"+"Name"+"\t"+"Chinese"+"\t"+
                "English"+"\t"+"Math"+"\t"+"Sum"+
                "\t"+"Average"+"\n";

        ret = ret+this.name+"\t"+"\t";
        ret = ret+this.chinese+"\t"+"\t";
        ret = ret+this.english+"\t"+"\t";
        ret = ret+this.math+"\t"+"\t";
        ret = ret+this.getSum()+"\t"+"\t";
        ret = ret+this.getAverage()+"\t"+"\t";
        return ret;
    }
}




public class PT9_3_2 {

    public static void main(String []args) {
        Student2 std1 = new Student2("Ann",96,90,"90b");

        std1.setHeight(170);
        std1.setWeight(50);
        System.out.println("Myname is: " + std1.getName() + " BMI is: " + std1.BMI());

        System.out.println("Sum: "+std1.getSum());
        System.out.println("Average: "+std1.getAverage());
        System.out.println(std1);

    }
}
