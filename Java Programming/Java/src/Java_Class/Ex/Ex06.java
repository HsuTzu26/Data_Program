package Java_Class.Ex;

public class Ex06 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        int x = 10, y = 20, z = 30;
        boolean a, b;

        a = x > y; // 10 沒有大於20 所以 a = false
        b = z > y; // 30大於20 所以 b = true

        if (a) {
            System.out.println("a的值為「true」");
        } else if (a && b) {
            System.out.println("a和b的同時值為「true」");
        } else {
            if (!b) {
                System.out.println("b 為 false");
            } else {
                System.out.println("其它的可能");
            }
        }
    }

}

