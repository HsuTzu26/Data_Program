public class TEST {

    public static void main(String[] args) {

        long time1, time2, time3;

        time1 = System.currentTimeMillis();

        for (int i = 0; i < 10000000; i++) {
            System.out.print("*");
        }

        time2 = System.currentTimeMillis();

        hello();

        time3 = System.currentTimeMillis();

        System.out.println("Common Print: " + (time2 - time1) / 1000 + "s");

        System.out.println("Function Print: " + (time3 - time2) / 1000 + "s");

        //Result: Common Print cost time equals to Function Print's!

    }

    public static void hello() {

        for (int i = 0; i < 10000000; i++) {
            System.out.print("*");
        }
    }
}
