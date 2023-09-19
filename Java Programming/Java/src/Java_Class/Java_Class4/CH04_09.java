package Java_Class.Java_Class4;

/*檔案:CH04_09.java
 *說明:Arrays.fill方法實例
 */
import java.util.Arrays;
public class CH04_09{
    public static void main(String[] args){
        int A[]=new int[5];
        System.out.println("預定初始值");

        for (int i=0;i<A.length;i++){
            System.out.print(A[i]+" ");
        }
        System.out.println();
        Arrays.fill(A, 5);
        System.out.println("修正後初始值");

        for (int i=0;i<A.length;i++){
            System.out.print(A[i]+" ");
        }
        System.out.println();
        System.out.println("example for binary search");
        int[] B={7,6,9,4,5,1,10,15,22,16};
        for (int i=0;i<B.length;i++){
            System.out.print(B[i]+" ");
        }
        System.out.println();
        Arrays.sort(B);
        for (int i=0;i<B.length;i++){
            System.out.print(B[i]+" ");
        }
        System.out.println();
        int position=Arrays.binarySearch(B, 7);
        System.out.println(position);
    }
}
