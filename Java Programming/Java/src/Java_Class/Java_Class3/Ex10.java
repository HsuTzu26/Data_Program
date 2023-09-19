package Java_Class.Java_Class3;

public class Ex10 {
    public static void main(String[] args) {
        int[] FirstArray = new int[] { 1, 2, 3, 4, 5, 6 }; // 宣告一個int陣列，並初始化
        int[] SecondArray = new int[4]; // 宣告一個int陣列，但未初始化
        char[] s1= {'H','A','P','P','Y',' ','N','E','W',' ','Y','E','A','R' };
        char[] s2=new char[15];
        // 實際複製FirstArray的內容
        System.arraycopy(FirstArray, 2, SecondArray, 1, 2);
        System.arraycopy(s1, 6, s2, 0, 8);

        System.out.println("FirstArray的 內容為：");
        for (int i = 0; i < FirstArray.length; i++) {
            System.out.print(FirstArray[i]+", ");
        }
        System.out.println();
        System.out.println("SecondArray的 內容為：");
        for (int i = 0; i < SecondArray.length; i++) {
            System.out.print(SecondArray[i]+", ");
        }
        System.out.println();
        System.out.print("S1的 內容為：");
        for (int i = 0; i < s1.length; i++) {
            System.out.print(s1[i]);
        }
        System.out.println();
        System.out.print("S2的 內容為：");
        for (int i = 0; i < s2.length; i++) {
            System.out.print(s2[i]);
        }

    }
}
