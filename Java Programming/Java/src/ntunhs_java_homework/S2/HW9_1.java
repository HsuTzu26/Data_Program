package ntunhs_java_homework.S2;

public class HW9_1 {
    public static void prln(String str){
        System.out.println(str);
    }

    public static void main(String[]args){
        prln("Game Start");
        GuessNumber game = new GuessNumber();
        while(true){
            game.run();
        }
    }
}
