package Java_Class.Ex;

public class Ex04 {

    public static void main(String[] args) {
        // TODO Auto-generated method stub

        int number = 18;

        // +(加), -(減), *(乘), /(除), %(取餘數)
        int odd = number % 2; // 如果是奇數，則odd為1，否則為0

        boolean isOdd = (odd == 1) ? true : false;
        System.out.println(isOdd);
        // boolean isOdd;
        // if (odd == 1)
        //     isOdd = true;
        // else
        //     isOdd = false;

        if (isOdd) {
            System.out.println("數字 " + number + " 是奇數");
        } else {
            System.out.println("數字 " + number + " 是偶數");
        }

        int a = (odd ==1) ? 10 : 30;
        int b = (a > 25) ? a * 20 : a + 20;
        System.out.println("a= " + a);
        System.out.println("b= " + b);
    }

}
