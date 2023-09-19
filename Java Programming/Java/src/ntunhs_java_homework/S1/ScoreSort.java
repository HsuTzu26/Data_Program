package ntunhs_java_homework.S1;

public class ScoreSort {

    public static void main(String[] args) {
        int[] math = {50, 65, 80, 48, 35, 93, 57, 90, 86, 77};
        int count_pass = 0, count_Npass = 0;

        ArrayTools.reverse(math);  //由大到小排序

        System.out.println("由大至小排序: ");

        for (int i = 0; i <= math.length - 1; i++) {

            System.out.printf("%3d", math[i]);

            if (math[i] >= 60) {
                count_pass++;
            } else if (math[i] < 60) {
                count_Npass++;
            }
        }

        System.out.println();

        System.out.println("及格人數: " + count_pass);
        System.out.print("不及格人數: " + count_Npass);

    }
}
