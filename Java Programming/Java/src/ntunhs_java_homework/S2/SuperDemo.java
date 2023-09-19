package ntunhs_java_homework.S2;

class Student3 {

    protected String name;

    private int weight, height;

    Student3() {

        weight = 0;

        height = 0;
    }

    Student3(String name, int weight, int height) {

        this.name = name;

        this.weight = weight;

        this.height = height;

    }

    public double BMI() {

        double height = this.height / 100.0;

        double bmi = this.weight / (height * height);

        return bmi;

    }

    void showData() {

        System.out.printf("姓名:%s \t體重:%s \t身高:%s \tBMI:%.2f",

                this.name, this.weight, this.height, this.BMI());

    }

}

class SonStudent extends Student3 {

    private int score;

    SonStudent() {

        super();

        this.score = 0;
    }


    SonStudent(String name, int weight, int height, int score) {

        super(name, weight, height);

        this.score = score;

    }

    void showData() {

        super.showData();

        System.out.printf("\t成績:%d", this.score);

    }

}


public class SuperDemo {

    public static void main(String[] args) {

        SonStudent Peter = new SonStudent("Peter",65, 164, 99);

        Peter.showData();

    }

}
