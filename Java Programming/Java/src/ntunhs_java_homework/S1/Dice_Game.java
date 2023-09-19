package ntunhs_java_homework.S1;

import java.util.ArrayList;
import java.util.Random;

/*
簡易骰子遊戲
萌芽系列網站 ‧ Mnya Series Website ‧ Mnya.tw
*/

public class Dice_Game {
    public static void main(String[] args) {
        int times = 1;

        System.out.println("---開始擲骰子---");
        System.out.println("這是您第" + times + "次遊玩。\n");
        Player player = new Player();
        player.Storage();
        player.DisplayNum();
        times++;
        System.out.println("");

        System.out.println("---遊戲結束---");
        player.Judge();

    }
}

// 玩家

class Player {
    ArrayList<Dice> diceList = new ArrayList<Dice>();
    Dice d1 = new Dice();
    Dice d2 = new Dice();
    Dice d3 = new Dice();
    Dice d4 = new Dice();
    Dice d5 = new Dice();
    Dice d6 = new Dice();

    void Storage() {
        diceList.add(d1);
        diceList.add(d2);
        diceList.add(d3);
        diceList.add(d4);
        diceList.add(d5);
        diceList.add(d6);
    }

    void DisplayNum() {
        for (int i = 0; i < diceList.size(); i++) {
            System.out.print((diceList.get(i).num) + ", ");
        }
        System.out.println("");
    }

    // 判斷

    void Judge() {
        int repeat = 0; // 重複次數
        int straight = 0; // 遞增現象偵測到的次數
        for (int i = 0; i < diceList.size(); i++) {
            for (int j = i + 1; j < diceList.size(); j++) {
                if ((diceList.get(i).num) == (diceList.get(j).num)) {
                    repeat++;
                }
                if (((diceList.get(i).num) + 1) == (diceList.get(j).num)) {
                    straight++;
                }
            }
        }
        if (repeat == 1) {
            System.out.println("pair");
        } else if (repeat == diceList.size()) {
            System.out.println("恭喜，您中頭獎囉!");
        } else if (straight == (diceList.size())) {
            System.out.println("恭喜，您中貳獎囉");
        } else {
            int total = 0;
            for (int i = 0; i < diceList.size(); i++) {
                total += diceList.get(i).num;
            }
            System.out.println("骰子點數相加總數為: " + total);
        }
    }

}

// 骰子

class Dice {
    Random ran = new Random();
    int num = (ran.nextInt(6) + 1); // 1~6 隨機生成
}