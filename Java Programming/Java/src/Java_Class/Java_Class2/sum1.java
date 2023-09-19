package Java_Class.Java_Class2;

public class sum1 {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        System.out.println("sum="+Sum(10));
        System.out.println("sum="+total(10));
    }
    public static int Sum(int n) {
        if (n==1) return 1;
        return n+Sum(n-1);
    }

    public static int total(int n) {
        int i,sum=0;
        for (i=1; i<=n; i++) {
            sum=sum+i;
        }
        return sum;
    }
}
