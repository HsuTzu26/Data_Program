package Java_Class.Java_Class3;

public class Ex05 {
    public static void main(String[] args) {

        int[] math_score = new int[] {85,95,90};

        //math_score[0] = 85;
        //math_score[1] = 95;
        //math_score[2] = 90;

        //System.out.println("三位學生的成績分別為：");

        // foreach無法用來設定陣列中元素的內容
        for (int element : math_score) {
            element = 0;	// 無法設定到 math_score
            System.out.println(element);
        }

        for (int element : math_score) {
            System.out.print(element+" ");
        }
    }

}
