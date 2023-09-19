package Java_Class.Java_Class3;

public class Ex08_1 {
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        int[] FirstArray = { 1, 2, 3, 4 }; // 宣告一個int陣列，並初始化
        int[] SecondArray = new int[4]; // 宣告一個int陣列，但未初始化

        System.out.print("最開始FirstArray的內容為：");
        PrintArray(FirstArray);
        System.out.print("最開始SecondArray的內容為：");
        PrintArray(SecondArray);

        //copy array
        SecondArray = clone(FirstArray);

        System.out.print("最開始FirstArray的內容為：");
        PrintArray(FirstArray);
        System.out.print("最開始SecondArray的內容為：");
        PrintArray(SecondArray);

        System.out.println("memory address:"+FirstArray+" : "+SecondArray);

    }

    public static void PrintArray(int[] ArrayName) {
        for (int i = 0; i < ArrayName.length; i++) {
            System.out.print(" " + ArrayName[i] + " ");
        }
        System.out.println();
    }

    public static int[] clone(int[] data)
    {
        int[] ret = new int[data.length];
        for (int i=0;i<data.length;i++)
        {
            ret[i]=data[i];
        }

        return ret;
    }
}
