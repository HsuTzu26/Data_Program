package Java_Class.Ex;

public class Ex05 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        int score = 50; // 指定學生分數 為85分

        if (score >= 90 & score <= 100) {
            System.out.println("分數是： " + score + " ，等級為 A");
        } else if (score >= 80 & score < 90) {
            System.out.println("分數是： " + score + " ，等級為 B");
        } else if (score >= 70 & score < 80) {
            System.out.println("分數是： " + score + " ，等級為 C");
        } else if (score >= 60 & score < 70) {
            System.out.println("分數是： " + score + " ，等級為 D");
        } else {
            System.out.println("分數是： " + score + " ，等級為 E");
        }
        System.out.println("程式執行完畢!!!");
    }

}

