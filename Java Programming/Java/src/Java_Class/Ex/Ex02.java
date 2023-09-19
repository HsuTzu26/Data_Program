package Java_Class.Ex;

public class Ex02 {
    public static void main(String[] args) {
        int i = 10;
        // ++ 表示 +1，-- 表示 -1;
        // 放前面表示先做，放後面表示後做
        //
        // Example: j = i++ 表示先將 i 的值丟給 j，再做 i = i + 1

        int j = i++;
        // int j = i;
        // i = i + 1;

        // int j = ++i;
        // i = i + 1;
        // int j = i;

        // 使用短路運算子「&&」表示 and (且)，「||」表示 or (或)
        //
        // A && B ， 當 A 不成立，B 不用檢查，因為整句一定不會成立
        // A || B ， 當 A 成立，B 不用檢查，因為整句一定會成立

        // i = 11 j = 10
        // i >= ++j
        //   j = j + 1
        //   i >= j (i = 11, j = 11)
        //
        // (i++ == j)
        //   i == j (true)
        //   i = i + 1 (i = 12)
        if ((i >= ++j) && (i++ == j)) { // 若 (i >= ++j) 不成立
            // 則後面的 (i++ == j) 完全不會執行
            i += j; // 等於 i = i + j;
            // i -= j; // i = i - j
        }

        System.out.println("執行後：i = " + i + " ，j = " + j);
    }

}
