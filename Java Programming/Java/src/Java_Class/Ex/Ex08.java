package Java_Class.Ex;

public class Ex08 {

    /**
     * @param args
     */
    public static void main(String[] args) {

        int i = 2, j = 0;
        switch (i) {
            case 0:
                j += 0;
                break;
            case 2:
            case 3: //two cases do the same thing
                j += 2;
                // break;
            case 4:
                j += 4;
                break;
            default:
                j += 6;
        }
        System.out.println("程式執行後，j = " + j);
    }

}
