package ntunhs_java_homework.S1;

import java.util.ArrayList;

public class Homework {

    static void bubbleSort(int array[][], int n) {
        for (int i = 0; i < 5 - 1; i++) {
            for (int j = 0; j < 5 - 1 - i; j++) {
                int tmp = 0;
                if (array[j][4] < array[j + 1][4]) {
                    tmp = array[j + 1][4];
                    array[j + 1][4] = array[j][4];
                    array[j][4] = tmp;
                }
            }
        }
    }

    static void list(int arr[][], int n) {
        ArrayList<Integer> list = new ArrayList<>();
        int x, y;

        for (x = 0; x < arr.length; x++) {

            for (y = 0; y < arr[x].length; y++)
                list.add(arr[x][y]);

        }
    }

    public static void main(String[] args) {
        int score[][] = {
                {1, 76, 80, 66, 0, 0},
                {2, 88, 92, 35, 0, 0},
                {3, 90, 94, 95, 0, 0},
                {4, 100, 98, 78, 0, 0},
                {5, 68, 70, 56, 0, 0}
        };


        int x;
        int y;
        int sum = 0;
        double avg = 0;
        String[] ss = new String[5];



        for (x = 0; x <= score.length - 1; x++) {
            sum = 0;
            avg = 0;
            for (y = 0; y <= score.length - 2; y++) {
                sum += score[x][y+1];
            }
            score[x][4] = sum;
            score[x][5] = sum / (score[x].length - 3);
        }

//        for (x = 0; x <= score.length - 1; x++) { //Before sorting
//
//            System.out.printf("%4d", score[x][4]);
//        }

        System.out.println("  座號  國文  英文  數學 總分  平均");
        for (x = 0; x < score.length; x++) {

            for (y = 0; y < score[x].length; y++)
                System.out.printf("%5d", score[x][y]);
            System.out.printf("\n");
        }

        System.out.println();

//        bubbleSort(score, 5); //sort後順序: 3 4 1 2 5
//        for (x = 0; x <= score.length - 1; x++) {
//
//            System.out.printf("%4d", score[x][4]);
//        }
        ArrayList<Integer> list1 = new ArrayList<>();
        ArrayList<Integer> list2 = new ArrayList<>();
        ArrayList<Integer> list3 = new ArrayList<>();
        ArrayList<Integer> list4 = new ArrayList<>();
        ArrayList<Integer> list5 = new ArrayList<>();


        for (y = 0; y <= 4; y++) {
            list1.add(score[0][y]);
            list2.add(score[1][y]);
            list3.add(score[2][y]);
            list4.add(score[3][y]);
            list5.add(score[4][y]);
        }


        System.out.println("座號  國文  英文  數學 總分  平均");
//        list3.forEach(any -> System.out.printf("%5d", any));
//        System.out.println();
//        list4.forEach(any -> System.out.printf("%5d", any));
//        System.out.println();
//        list1.forEach(any -> System.out.printf("%5d", any));
//        System.out.println();
//        list2.forEach(any -> System.out.printf("%5d", any));
//        System.out.println();
//        list5.forEach(any -> System.out.printf("%5d", any));


        for (x = 0; x < score.length-1; x++) {
            sum = 0;
            avg = 0;
            for (y = 0; y <= score[x].length-1; y++) {
                System.out.print(score[x][y] + "\t");
            }
            System.out.print(sum + "\t");
            System.out.printf("%.2f", avg, "\t");
            System.out.println();
        }

    }
}