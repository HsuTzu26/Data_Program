package ntunhs_java_homework.S2;

public class PT9_2 {
    public static void main(String[]args) {

        Person person = new Person();
        Person person2 = new Person("Hsu", 155, 52);

        System.out.println("First Person's BMI: " + person.BMI());
        System.out.print("Sencond Person's BMI: " + person2.BMI());

    }
}
