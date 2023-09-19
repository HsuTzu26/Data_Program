package Java_Class.Java_Class3;

public class Ex08 {
    public static void main(String[] args) {

        int[] FirstArray = { 1, 2, 3, 4 }; // 宣告一個int陣列，並初始化
        //int[] FirstArray = new int[]{1, 2, 3, 4};
//			int[] FirstArray;
//			FirstArray = new int[]{1, 2, 3, 4};
        int[] SecondArray = new int[4]; // 宣告一個int陣列，但未初始化

        System.out.print("最開始FirstArray的內容為：");
        PrintArray(FirstArray);
        System.out.print("最開始SecondArray的內容為：");
        PrintArray(SecondArray);

        System.out.println(FirstArray+" : "+SecondArray);

        SecondArray = FirstArray; // two arrays point to the same memory address
        System.out.println(FirstArray+":"+SecondArray);

        System.out.print("最開始FirstArray的內容為：");
        PrintArray(FirstArray);
        System.out.print("最開始SecondArray的內容為：");
        PrintArray(SecondArray);

        FirstArray[2] = 100; // 重新指定FirstArray第3個元系的值為100
        SecondArray[2] = 200;

        System.out.print("改變後FirstArray的內容為：");
        PrintArray(FirstArray);
        System.out.print("改變後SecondArray的內容為：");
        PrintArray(SecondArray);
    }

    public static void PrintArray(int[] ArrayName) {
        for (int i = 0; i < ArrayName.length; i++) {
            System.out.print(" " + ArrayName[i] + " ");
        }
        System.out.println();
    }

}

