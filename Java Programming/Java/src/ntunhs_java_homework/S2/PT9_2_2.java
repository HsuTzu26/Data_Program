package ntunhs_java_homework.S2;

public class PT9_2_2 {
    public static void main(String[]args) {

        Person2 person = new Person2();
        Person2 person2 = new Person2("Hsu", 155, 52);

        System.out.println("First Person's BMI: " + person.BMI());
        System.out.print("Sencond Person's BMI: " + person2.BMI());

    }
}
