package ntunhs_java_homework.S2;

public class Person {

    String name;
    int height;
    int weight;

    public Person(){
        this.name = "Waga";
        this.height = 155;
        this.weight = 52;
    }

    Person(String name) { //extends
        this.name = name;
    }

    Person(String name, int height, int weight) {
        this.name = name;
        this.height = height;
        this.weight = weight;
    }

    //BMI = 體重(公斤) / 身高2(公尺2)
    public int BMI() {

        float h = (((float)height/100) *  ((float) height/100));
        int bmi = (int)(weight / h);
        return bmi;
    }
}
