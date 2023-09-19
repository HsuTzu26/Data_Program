package Java_Class.Ex;

public class Ex03 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        int score = 80;
        if (score >= 60) { // 判斷條件是否成立，目前會成立
            System.out.println("成績為：" + score + " ，及格"); // 成立
        } else {
            System.out.println("成績為：" + score + " ，不及格");// 不成立
        }
        System.out.println("程式執行完成 ");
    }

}
