package Java_Class.Ex;
//程式:CH02_07.java, 基本輸入
import java.io.*;

public class CH02_07 {
    // private static char myData;
    public static void main(String args[]) throws IOException {
        int myData;
        int a,b;
        System.out.print("[基本輸入練習]\n");
        System.out.print("請輸入文字：");
        // 文字輸入
        myData = System.in.read();
        a=myData-48;
        b=a+1;
        System.out.println("輸入的資料為：" + myData);
        System.out.println("輸入的資料為：" + (char)myData);
        System.out.println("輸入的資料為：" + a);
        System.out.println("輸入的資料為：" + (char)a);
        System.out.println("輸入的資料為：" + b);
        System.out.println("輸入的資料為：" + (char)b);

        int x=19, y=4;
        System.out.println("x/y：" + x/y);

        double z;
        z=x/y;
        System.out.println("z：" + z);
        z=(double)(x/y);
        System.out.println("z：" + z);
        z=(double)x/y;
        System.out.println("z：" + z);
        System.out.println("x/y：" + (double)x/(double)y);

        int i,j;
        i=0;
        j=i++;
        System.out.println("i：" + i);
        System.out.println("j：" + j);
        i=0;
        j=++i;
        System.out.println("i：" + i);
        System.out.println("j：" + j);



    }
}
