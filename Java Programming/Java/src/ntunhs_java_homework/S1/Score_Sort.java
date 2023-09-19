package ntunhs_java_homework.S1;

import java.util.Arrays;

public class Score_Sort {

    public static void main(String[] args) {
        int score[][] = {
                {1, 76, 80, 66},
                {2, 88, 92, 35},
                {3, 90, 94, 95},
                {4, 100, 98, 78},
                {5, 68, 70, 56}
        };


        int x,y;

        System.out.println("座號\t國文\t英文\t數學\t");
        for (x = 0; x < score.length; x++) {

            for (y = 0; y < score[x].length; y++)
                System.out.printf("%4d", score[x][y]);
            System.out.printf("\n");
        }



        int[] sum = new int[score.length];
        for (int i = 0; i < sum.length; i++) {
            sum[i] = ArrayTools.sum(score[i]);
        }

        System.out.println("座號\t國文\t英文\t數學\t總分\t平均\t");
        for (int i = 0; i < score.length; i++) {
            int student_id = i;
            String strScore = ArrayTools.toString(score[student_id]);
            int student_sum = sum[student_id];
            double student_avg = (double) student_sum / score[student_id].length;
            System.out.print(strScore + student_sum + "\t");
            System.out.printf("%.2f", student_avg);
            System.out.println();
        }


        int score2[][] = new int[][]{
                {1, 76, 80, 66},
                {2, 88, 92, 35},
                {3, 90, 94, 95},
                {4, 100, 98, 78},
                {5, 68, 70, 56}
        };

        int[] sum2 = new int[score2.length];
        for (int i = 0; i < sum2.length; i++) {
            sum2[i] = ArrayTools.sum(score2[i]);
        }
//        ArrayTools.print(sum);
        int[] sorted2 = Arrays.copyOf(sum2, sum2.length);

        Arrays.sort(sorted2);
        ArrayTools.reverse(sorted2);
//        ArrayTools.print(sum);
//        ArrayTools.print(sorted);

        int[] idx2 = new int[sorted2.length];
        for (int i = 0; i < sorted2.length; i++) {
            int value = sorted2[i];
            idx2[i] = ArrayTools.search(sum2, value);
        }
//        ArrayTools.print(idx);

        System.out.println("成績統計程式:");
        System.out.println("座號\t國文\t英文\t數學\t總分\t平均\t");
        for (int i = 0; i < idx2.length; i++) {
            int student_id = idx2[i];
            String strScore = ArrayTools.toString(score2[student_id]);
            int student_sum = sum2[student_id];
            double student_avg = (double) student_sum / score2[student_id].length;
            System.out.print(strScore + student_sum + "\t");
            System.out.printf("%.2f", student_avg);
            System.out.println();
        }

    }
}