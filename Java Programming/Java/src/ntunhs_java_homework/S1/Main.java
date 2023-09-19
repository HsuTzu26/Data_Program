package ntunhs_java_homework.S1;

public class Main {

    public static void main (String[]args) {

        int arr[] = {13, 25, 39, 19, 9, 47, 10, 57, 58, 283, 43, 349};

        System.out.printf("總和:%d\n", ArrayTools.sum(arr)); //952
        System.out.printf("最大值:%d\n", ArrayTools.max(arr)); //349
        System.out.printf("最小值:%d", ArrayTools.min(arr)); //9

    }
}
