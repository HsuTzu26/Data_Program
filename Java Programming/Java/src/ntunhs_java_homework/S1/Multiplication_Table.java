package ntunhs_java_homework.S1;

public class Multiplication_Table { //Multiplication Table or Times Table

    public static void main(String[] args) {

        for (int i = 1; i <= 9; i++) { // 注意執行後，i的值
            for (int j = 1; j <= 9; j++) {
                System.out.print(i + "*" + j + "=" + i * j + "\t");
            }
            System.out.println();
        }

        System.out.println();

        int a = 0;
        while (++a < 10) {
            int b = 0;
            while (++b < 10) {
                System.out.print(a + "*" + b + "=" + (a * b) + "\t");
            }
            System.out.println();
        }

        System.out.println();

        a = 1;
        do {
            int b = 1;
            do {
                System.out.print(a + "*" + b + "=" + (a * b) + "\t");
            } while (b++ < 9);
            System.out.println();
        } while (a++ < 9);



        /*for (int i = 1; i < 10; i++) {

            for (int j = 1; j < 10; j++) {

                if (i * j < 10) {

                    System.out.print(i + "x" + j + "=" + i * j + "  ");//把最前面的i跟j換位置，就可以換行列

                } else {

                    System.out.print(i + "x" + j + "=" + i * j + " ");

                }

            }

            System.out.print("\n");
        }

        int i = 1;
        int j;
        int k = 1;

        while (i <= 3) {

            j = 1;
            while (j <= 9) {

                while (k <= (i * 3)) {
                    System.out.printf("|%d*%d=%2d", k, j, j * k);
                    k++;
                }
                System.out.println("|");
                j++;
                k = k - 3;
            }
            i++;
            k = k + 3;
        }

        System.out.println();

        i = 1;
        j = 0;
        k = 1;

        do {

            j = 1;
            do {
                do {
                    System.out.printf("|%d*%d=%2d", k, j, j * k);
                    k++;
                } while (k <= (i * 3));  //條件後方記得加上  ;
                System.out.println("|");
                j++;
                k = k - 3;
            } while (j <= 9);
            i++;
            k = k + 3;
        } while (i <= 3);

        System.out.println();*/


    }
}


