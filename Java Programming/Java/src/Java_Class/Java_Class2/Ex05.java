package Java_Class.Java_Class2;

public class Ex05 {

    /**
     * @param args
     */
    public static void main(String[] args) {
        System.out.println("Sum:" + Sum(10));
    }

    public static int Sum2(int n){
        int sum=0;
        for (int i = 1; i <= n; i++) { // 注意執行後，i的值
            sum = sum + i; // 重複執行的敘述
            // sum += i;
        }
        return sum;
    }
    public static int Sum(int n) {

        // 當 n 為 1 時，直接回傳 1
        if (n == 1)
            return 1;

        return n + Sum(n - 1);
    }
}

