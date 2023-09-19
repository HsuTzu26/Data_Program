package ntunhs_java_homework.S2;

import java.util.Scanner;

public class Counter { //計數器類別

    Scanner scanner = new Scanner(System.in);

    private int count = scanner.nextInt();

//    public Counter() {count = 0; }
    public Counter() {
        this.count = count;
    }

    public int getCount() { return count; }

    public int setCount(){count=0;
        return count;
    }

    public void incrementCount() { count++; }

    public void decrementCount() { count--;
        if(count < 0 ){
            count = 0;
            System.out.println("此值不可為負值");
        }
    }
}
