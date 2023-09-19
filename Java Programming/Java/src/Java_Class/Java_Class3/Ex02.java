package Java_Class.Java_Class3;

public class Ex02 {

    public static void main(String[] args) {

        int[] math_score = new int[3];

        math_score[0] = 85;
        math_score[1] = 95;
        math_score[2] = 90;

        System.out.println("三位學生的成績分別為：");

        for (int i = 0; i < 3; i++) {
            System.out.println("第" + (i + 1) + "位學生的成績是：" + math_score[i]);
        }
    }

}
