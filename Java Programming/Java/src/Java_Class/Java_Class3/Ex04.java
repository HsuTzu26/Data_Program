package Java_Class.Java_Class3;

public class Ex04 {
    public static void main(String[] args) {

        int[] math_score = new int[3];

        math_score[0] = 85;
        math_score[1] = 95;
        math_score[2] = 90;

        System.out.print("三位學生的成績分別為：");
        int sum=0;
        // JDK 1.5 之後可使用 foreach
        for (int element : math_score) {
            element=0;
            sum=sum+element;
            System.out.print(element+" ");
        }
        System.out.println();
        System.out.println("total="+sum);

        for (int i = 0; i < math_score.length; i++) {
            System.out.println("第" + (i + 1) + "位學生的成績是：" + math_score[i]);
        }
    }
}
