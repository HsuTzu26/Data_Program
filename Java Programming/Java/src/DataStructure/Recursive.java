package DataStructure;

public class Recursive {

    // 方法: 計算階層函數(遞迴方式)
    static int factorial (int n)
    {
        if ( n == 1 )
            return 1;
        else
            return  n * factorial(n-1);
    }

    //遞迴 (Recursion)
    int Sum(int n)
    {
        int Result;
        if (n==1)
            Result = 1;
        else
            Result = n * Sum(n-1);
        return Result;
    }

    //非遞迴 (Non-recursion)
    int n_Sum(int n)
    {
        int i, Result=1;

        for (i=n;i<1;i--)
            Result *= i;
        return Result;
    }
    public static void main(String []args)
    {
    }
}
