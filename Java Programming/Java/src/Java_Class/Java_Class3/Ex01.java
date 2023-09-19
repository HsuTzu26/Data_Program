package Java_Class.Java_Class3;

public class Ex01 {

    public static void main(String[] args) {

        int[] math_score = new int[3];
        // int[] math_score;
        // math_score = new int[3];


        math_score[0] = 59;
        math_score[1] = 95;
        math_score[2] = 90;

        System.out.println("三位學生的成績分別為：");

        System.out.println("math_score memory address：" + math_score);
        System.out.println("第1位學生的成績是：" + math_score[0]);
        System.out.println("第2位學生的成績是：" + math_score[1]);
        System.out.println("第3位學生的成績是：" + math_score[2]);
        //System.out.println("第3位學生的成績是：" + math_score[3]);
    }

}

