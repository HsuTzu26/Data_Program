package ntunhs_java_homework.S1;

import java.util.Scanner;

public class Switch {

    private static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {

        System.out.print("Please input one level to search you score area: ");
        String str = input.nextLine();
        input.close();

        switch (str) {
            case "A+":
                System.out.print("Score area: 90~100");
                break;
            case "A":
                System.out.print("Score area: 85~89");
                break;
            case "A-":
                System.out.print("Score area: 80~84");
                break;
            case "B+":
                System.out.print("Score area: 77~79");
                break;
            case "B":
                System.out.print("Score area: 73~76");
                break;
            case "B-":
                System.out.print("Score area: 70~72");
                break;
            case "C+":
                System.out.print("Score area: 67~69");
                break;
            case "C":
                System.out.print("Score area: 63~66");
                break;
            case "C-":
                System.out.print("Score area: 60~62");
                break;
            case "D":
                System.out.print("Score area: 50~59");
                break;
            case "E":
                System.out.print("Score area: 40~49");
                break;
            case "F":
                System.out.print("Score area: under 39");
                break;
            default:
                System.out.print("Please Input correct level!!!");

        }
    }
}
