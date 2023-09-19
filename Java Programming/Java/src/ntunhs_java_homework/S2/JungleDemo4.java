package ntunhs_java_homework.S2;

class Animal7 {
    private int age;
    private int weight;

    private static int number = 0;

    public Animal7(int a, int w) {
        number++;
        setAge(a);
        setWeight(w);
        System.out.println("使用兩個參數的建構子，Animal物件已建立....");
    }

    public Animal7(int w) {
        this(3, w);
        number++;
    }

    public Animal7() {
        this(3, 15);
        number++;
    }


    public int getAge() {
        return age;
    }

    public void setAge(int n) {
        if (n < 0) {
            age = 1;
        }
        else {
            age = n;
        }
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int n) {
        if (n < 0) {
            weight = 1;
        }
        else {
            weight = n;
        }
    }

    public void speak() {
        System.out.println("哈囉，我已經" + getAge() + "歲，有" + getWeight() + "公斤重");
    }
    public static int getNumber() {
        return number;
    }
}

class Elephant extends Animal7 {
    private String name;

    public Elephant(String n, int a, int w) {
        super(a, w);
        //setAge(a); setWeight(w); 
        setName(n);
        System.out.println("使用三個參數的建構子，Elephant物件已建立....");

    }

    public Elephant(int a, int w) {
        this("小象", a, w);
    }

    public Elephant() {
        this("小象", 3, 150);
    }

    public String getName() {
        return name;
    }

    public void setName(String n) {
        if (n == null || n.equals("")) {
            name = "無名氏";
        }
        else {
            name = n;
        }
    }

    public void speak() {
        super.speak();
        System.out.println("我的名字是" + getName());
    }

}

class Elk extends Animal7{
    private String name;
    private double antlers_cm;

    public Elk(String n, int a, int w, double antlers){
        super(a, w);
        setName(n);
        setAntlers(antlers);
        System.out.println("使用三個參數的建構子，Elk物件已建立....");
    }

    public Elk(int a, int w, double antlers) {
        this("NonameElk", a, w, antlers);
    }

    public Elk() {
        this("StrangeElk", 3, 150, 100);
    }

    public String getName() {
        return name;
    }

    public void setName(String n) {
        if (n == null || n.equals("")) {
            name = "無名氏";
        }
        else {
            name = n;
        }
    }

    public void setAntlers(double antlers){
        antlers_cm = antlers;
    }

    public double getAntlers(){
        return antlers_cm;
    }

    public void speak() {
        super.speak();
        System.out.println("我的Elk名字是" + getName() + ", The antler length: " + getAntlers());
    }

}





public class JungleDemo4 {
    public static void main(String[] args) {
        System.out.println("動物有" + Animal7.getNumber() + "隻");
        System.out.println("--------------------");
        Elephant puppy1 = new Elephant("大象", 6, 70);
        puppy1.speak();
        System.out.println("--------------------");
        Elephant puppy2 = new Elephant(10, 142);
        puppy2.speak();
        System.out.println("--------------------");
        Elephant puppy3 = new Elephant();
        puppy3.speak();
        System.out.println("--------------------");
        Elk deer1 = new Elk("American Elk1", 5, 170, 110.05);
        deer1.speak();
        Elk deer2 = new Elk("", 8, 300, 200.05);
        deer2.speak();
        Elk deer3 = new Elk();
        deer2.speak();
        System.out.println("--------------------");
        System.out.println("動物有" + Animal7.getNumber() + "隻");
    }

}