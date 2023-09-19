package Test;
import java.util.Collections;
import java.util.Arrays;
import java.util.ArrayList;

public class Test {

    public static void main(String[] args) {

        //To display set of six numbers between 1 to 49.
        ArrayList<Integer> numbers = new ArrayList<Integer>();
        for (int i = 0; i < 49; i++) {
            numbers.add(i+1);
        }

        for (int i = 0; i < 49; i++) {
            Collections.shuffle(numbers);
        }

        System.out.print("The lottery numbers are: ");

        int[] lottery_num = new int[6];

        for (int j = 0; j < 6; j++) {

            lottery_num[j] = numbers.get(j);
        }

        Arrays.sort(lottery_num);
        System.out.println(Arrays.toString(lottery_num));
    }
}
