package Java_Class.Ex;

public class ex001
{
    //main方法是程式的入口，執行程式從這裡開始
    public static void main(String[] args)
    {
        System.out.println("呼叫副程式");
        printStar(1);
        printStar(2);
        printStar(3);
        System.out.println("副程式結束");
        System.out.println();	//斷行

        double a = 3;
        double b = 4;
        double c = trigonometric(a, b);
        System.out.println("直角三角型二邊長為 " + a + " 和 " + b + "，則第三邊長為 " + c);
    }

    //方法基本宣告方式：
    //物件導向的修飾字 回傳值 方法名稱(傳入參數) {}

    //void表示沒有回傳值
    private static void printStar(int n) {	//輸出n個星星
        if(n != 0) {
            for (int i = 0; i<n; i++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }

    private static double trigonometric(double a, double b) {	//輸入直角三角型二個短邊長
        //Math.pow(底數, 次方)：Java計算次方的方法，回傳double值
        double cSquare = Math.pow(a, 2) + Math.pow(b, 2);	//二邊長的平方相加等於鈄邊平方

        return Math.pow(cSquare, 0.5);	//回傳鈄邊長
    }
}
