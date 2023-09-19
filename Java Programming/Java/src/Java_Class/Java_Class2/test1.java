package Java_Class.Java_Class2;

public class test1
{
    static int a = 1;	//全域變數，Java又稱「成員變數(Member Variable)」
    //變數範圍: 2-35行的方法，或3-35行的全域變數
    public static void main(String[] args)
    {
        int b = 5;			//區域變數範圍: 8-22行
        System.out.println("10: 呼叫fun前，a=" + a + " b=" + b + " c=" + c);
        System.out.println("******");
        fun(b);
        System.out.println("******");

        System.out.println("15: 執行while前，a=" + a + " b=" + b + " c=" + c);
        while(c == 1) {
            int a = 3;		//區域變數範圍: 17-20行
            c = a;
            System.out.println("19: 在while內，a=" + a + " b=" + b + " c=" + c);
        }
        System.out.println("21: 結束while後，a=" + a + " b=" + b + " c=" + c);
    }
    private static void fun(int c) {	//區域變數，Java又稱「方法參數(Method Parameter)」
        //變數範圍: 23-32行
        System.out.println("25: 區域變數c剛傳入fun時，c=" + c);
        c = 2;
        System.out.println("27: 修改區域變數c後，c=" + c);

        System.out.println("29: 宣告區域變數a前，a=" + a);
        int a = 2;			//區域變數範圍: 30-32行
        System.out.println("31: 宣告區域變數a後，a=" + a);
    }
    static int c = a;	//全域變數範圍: 2-35行的方法
}

