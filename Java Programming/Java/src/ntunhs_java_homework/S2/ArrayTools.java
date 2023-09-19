package ntunhs_java_homework.S2;

public class ArrayTools {

    /**
     * 複製Array
     *
     * @param data original Array
     * @return cloned Array
     */
    public static int[] clone(int[] data) {
        int[] ret = new int[data.length];
        for (int i = 0; i < data.length; i++) {
            ret[i] = data[i];
        }

        return ret;
    }

    /**
     * 將陣列內容顯示出來
     *
     * @param data
     */
    public static void print(int[] data) {
        for (int i = 0; i < data.length; i++) {
            System.out.print(data[i] + "\t");
        }
        System.out.println();
    }

    public static void print(char[] data) {
        for (int i = 0; i < data.length; i++) {
            System.out.print(data[i] + "\t");
        }
        System.out.println();
    }

    /**
     * 作業：取陣列的最小值
     *
     * @param data
     * @return
     */
    public static int min(int[] data) {
        int min = data[0];
        for (int i = 1; i < data.length; i++) {
            if (data[i] < min) min = data[i];
        }
        return min;
    }

    /**
     * 作業：取陣列的最大值
     *
     * @param data
     * @return
     */
    public static int max(int[] data) {
        int max = data[0];
        for (int i = 1; i < data.length; i++) {
            if (data[i] > max) max = data[i];
        }
        return max;
    }

    /**
     * 作業：取陣列的總和
     *
     * @param data
     * @return
     */
    public static int sum(int[] data) {
        int ret = 0;
        for (int i = 0; i < data.length; i++) {
            ret = ret + data[i];
            //ret += data[i];
        }
        return ret;
    }

    //
    public static String toString(int[] data) {
        String ret = "";
        for (int i = 0; i < data.length; i++) {
            ret = ret + data[i] + "\t";
        }
        return ret;
    }

    public static boolean equals(int[] A, int[] B) {
        boolean ret = true;
        if (A.length != B.length) {
            ret = false;
        } else { // A.length == B.length
            for (int i = 0; i < A.length; i++) {
                if (A[i] != B[i]) {
                    ret = false;
                    break;
                }
            }
        }
        return ret;
    }

    /**
     * Sorts the specified array into ascending numerical order
     * @param data: the array
     * @return     No return
     */
    public static void sort(int[] data) {
        for (int i = 0; i < data.length - 1; i++) {
            // 此從 i到 length-1 中，找最小元素的 min_idx
            int min = data[i];
            int min_idx = i;
            for (int j = i + 1; j < data.length; j++) {
                if (data[j] < min) { // 改成「>」就是由小排到大了
                    min = data[j];
                    min_idx = j;
                }
            }
            // 將最小的元素(min_idx)和第i個元素交換 (每次可確保第i個一定最小的)
            int tmp = data[min_idx];
            data[min_idx] = data[i];
            data[i] = tmp;
        }
    }

    /**
     * Sorts the specified array into descending numerical order
     * @param data: the array
     * @return     No return
     */
    public static void reverse_sort(int[] data) {
        for (int i = 0; i < data.length - 1; i++) {
            // 此從 i到 length-1 中，找最小元素的 min_idx
            int max = data[i];
            int max_idx = i;
            for (int j = i + 1; j < data.length; j++) {
                if (data[j] > max) { // 改成「<」就是由大排到小了
                    max = data[j];
                    max_idx = j;
                }
            }
            // 將最小的元素(min_idx)和第i個元素交換 (每次可確保第i個一定最小的)
            int tmp = data[max_idx];
            data[max_idx] = data[i];
            data[i] = tmp;
        }
    }

    /**
     * 將array內容資料順序反轉
     *
     * @param data 欲反轉的陣列
     */
    public static void reverse(int[] data) {
        int n = data.length / 2;
        //int max=data.length-1;
        //int temp=0;
        for (int i = 0; i < n; i++) {
            int j = data.length - 1 - i;
            //swap(data[i], data[j]);
            int temp = data[i];
            data[i] = data[j];
            data[j] = temp;
        }
    }

    /**
     * 翻轉陣列
     *
     * @param data
     * @return
     */
    public static int[] reverse2(int[] data) {
        int[] newdata = new int[data.length];
        int j = data.length - 1;
        for (int i = 0; i <= j; i++) {
            //System.out.println(i+" "+j);
            newdata[i] = data[j - i];
        }
        return newdata;
    }


    /**
     * find the location of value in the array data
     *
     * @param data:  the array
     * @param value: the value you want to find
     * @return the location of value or return -1 if not in the array
     */
    public static int search(int[] data, int value) {
        int ret = -1;
        for (int i = 0; i < data.length; i++) {
            if (data[i] == value) {
                ret = i;
                break;
            }
        }
        return ret;
    }
}