package Java_Class.Java_Class3;

public class Ex07 {

    public static void main(String[] args) {

        int[] math_score = new int[3];
        boolean[] ans =new boolean[3];
        String[] bb = new String[3];
        char[] cc = new char[3];

        System.out.println("三位學生的成績分別為：");

        for (int i = 0; i < 3; i++)
            System.out.println("第" + (i + 1) + "位學生的成績是：" + math_score[i]);
        for (int i = 0; i < 3; i++)
            System.out.println("第" + (i + 1) + "位學生出席是：" + ans[i]);
        for (int i = 0; i < 3; i++)
            System.out.println("第" + (i + 1) + "string：" + bb[i]);
        for (int i = 0; i < 3; i++)
            System.out.println("第" + (i + 1) + "char：" + cc[i]+"/");
    }
}


