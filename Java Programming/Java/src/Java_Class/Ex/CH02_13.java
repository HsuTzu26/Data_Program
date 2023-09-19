package Java_Class.Ex;
/*檔名：CH02_13.java
 *說明：指定運算
 */
public class CH02_13{
    public static void main(String args[]){
        int A=5;
        System.out.println("A = 5 ");
        A+=3+2; //A=A+(3+2);
        System.out.println("A+= 3 + 2 的值為 "+(A));
        A=5;
        A-=5-4; //A=A-(5-4);
        System.out.println("A-= 5 - 4 的值為 "+(A));
        A=5;
        A*=2*3; //A=A*(2*3);
        System.out.println("A*= 2 * 3 的值為 "+(A));
        A=5;
        A/=10/5+3; //A=A/(10/5+3);
        System.out.println("A/= 10 / 5 + 3 的值為 "+(A));
        A=5;
        A%=15%4;
        System.out.println("A%= 10 % 3 的值為 "+(A));
        A=5;
        A &=5-3;
        System.out.println("A&= 5 - 3 的值為 "+(A));
        A=5;
        A|=2;
        System.out.println("A|= 2 的值為 "+(A));
        A=5;
        A^=2+1;
        System.out.println("A^= 2 + 1 的值為 "+(A));
    }
}
