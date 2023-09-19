package ntunhs_java_homework.S2;

/*
String str_score = "90,98,95,85,75,80,100,96,75,65";
使用,作為欄位分割字元，
使用,Integer.parseInt(stringVal); 轉換字串為整數。

計算:
1.總分
2.平均
3.最高分幾分
4.最高分的位置
 */

public class StringToInteger {

    public static void main(String[] args) {

        String str_score = "90,98,95,85,75,80,100,96,75,65";
        String[] split = str_score.split(",");
        int sum = 0;
        float avg = 0;
        int[] store = new int[split.length];
        int highest_score = 0;
        int index;

        for (int i=0; i < split.length; i++)
        {
//            System.out.println(split[i]);
            sum += Integer.parseInt(split[i]);
            store[i] = Integer.parseInt(split[i]);
//            System.out.println(store[i]);
        }

        index = maxIndex(store);
        highest_score = ArrayTools.max(store);



        avg = (float)sum / split.length;
        
        System.out.println("Sum: " + sum);
        System.out.println("Average: " + avg);
        System.out.println("Highest Score: " + highest_score);
        System.out.println("Highest Score Index: " + index);

        StringToInteger_method2();

    }

    public static int maxIndex(int data[])
    {
        int maxIndex = 0;
        int max = data[0];
        for (int i = 0; i < data.length; i++)
        {
            if(max < data[i]) {
                max = data[i];
                maxIndex = i;
            }
        }
        return maxIndex;
    }

    public static void StringToInteger_method2() {

        String str_score = "90,98,95,85,75,80,100,96,75,65";
        int[] math_score = new int[10];
        String[] score1 = str_score.split(",");

        int i=0, sum=0, score_element=0, score_max=0, score_index=0;

        for (String field : score1) {
            score_element = Integer.parseInt(field);
            math_score[i]=score_element;
            i++;
            sum += score_element;
            if(score_element > score_max) score_max = score_element;
            if(score_element == score_max) score_index=i;
        }

    }
}