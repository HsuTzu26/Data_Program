package Java_Class.Java_Class4;

//程式：CH04_11.java
//利用陣列集合加入不同資料型態
import java.util.*;
public class CH04_11{
    public static void main(String[] args){
        //宣告變數
        int a=50;
        double b=28.67;
        double c =123.456;
        String str1="abcde";
        Integer intVal=new Integer(10);
        String strVal=new String("Java");
        Long longVal=new Long("123");
        String str2="new string";
        int[] math_score = new int[] {85, 95,90};

        ArrayList alArray=new ArrayList();

        //新增資料字陣列集合
        alArray.add(a);
        alArray.add(b);
        alArray.add(str1);
        alArray.add(intVal);
        alArray.add(strVal);

        for(int i=0;i<alArray.size();i++){
            System.out.print("alArray集合中索引值 "+i+" 的物件值為：");
            System.out.println(alArray.get(i));
        }
        System.out.println("-------------------------");

        alArray.add(3, str2);
        alArray.add(1, c);
        for(int i=0;i<alArray.size();i++){
            System.out.print("alArray集合中索引值 "+i+" 的物件值為：");
            System.out.println(alArray.get(i));
        }
        System.out.println("-------------------------");

        alArray.remove(2);
        alArray.add(math_score);

        //陣列集合方法的應用
        System.out.print("檢查alArray集合中有無longVal物件：");
        System.out.println(alArray.contains(longVal));
        for(int i=0;i<alArray.size();i++){
            System.out.print("alArray集合中索引值 "+i+" 的物件值為：");
            System.out.println(alArray.get(i));
        }
        System.out.println("串列的內容 = "+alArray);
    }
}
