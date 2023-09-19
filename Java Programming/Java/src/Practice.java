import java.util.Scanner; //引入Scanner, 待會可以使用「使用者輸入」的功能

public class Practice {

    public static void main(String[] args) { //主條目, Java必須寫主條目, 才能夠執行程式

        System.out.print("我是單純輸出不換行！");
        System.out.println("我是輸出後換行！");
        System.out.printf("%s\n", "我是輸出, 而且需要指定格式！"); // 字串String用%s, 整數用%d, 有小數點用%f

        //資料型態(常用)
        int x; // 整數
        float y; //浮點數

        //if, else if, else 條件判斷
        //以簡單的1元, 5元, 10元為例; 這裡要注意一下, 條件式只要達成一項, 就不會繼續執行, 所以只會出現1元！
        int oneCoin = 1;
        int fiveCoin = 5;
        int tenCoin = 10;

        if(oneCoin == 1) //如果是1元, 輸出1元的值
        {
            System.out.println("我有" + oneCoin + "元"); // 輸出1元的值, 也就是1

        } else if(fiveCoin == 5) { //如果是5元, 輸出5元的值

            System.out.println("我有" + fiveCoin + "元"); // 輸出5元的值, 也就是5

        } else { //如果不是1元, 也不是5元, 那就是10元！

            System.out.println("我有" + tenCoin + "元"); // 輸出10元的值, 也就是10
        }


        // for 迴圈

        /*

        for ( 宣告變數; 判斷式; 遞增)
        {
           *執行區域*
        }

        */


        for(int i = 1; i < 10; i++) {

            System.out.println("i = " + i); //跑完迴圈會輸出1~9

        }

    }
}
