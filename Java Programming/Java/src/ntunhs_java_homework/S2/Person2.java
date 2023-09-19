package ntunhs_java_homework.S2;


public class Person2  extends Object{

    protected String  name;
    private int  height;
    private int  weight;

    public Person2() { // 使用者沒有提供資料
        this.name = "Peter";
        this.height = 175;
        this.weight = 70;
    }
    public Person2(String  name){
        this.name = name;
        this.height = 175;
        this.weight = 70;
    }
    public Person2(String  name,  int  height,  int  weight){
        this.name = name;
        this.height = height;
        this.weight = weight;
    }
    public double BMI() {
        double height = this.height / 100.0;
        double bmi = this.weight / (height * height);
        return bmi;
    }

    public String getName() {
        return this.name;
    } //取得name
    public void setName(String name) {
        this.name = name;
    } //設定姓名
    public void setWeight(int weight) {
        this.weight = weight;
    } //設定體重
    public void setHeight(int height) {
        this.height = height;
    }//設定身高
    public int getWeight() {
        return this.weight;
    }//取得體重
    public int getHeight() {
        return this.height;
    }//取得身高

    @Override
    public String toString() { //
        return this.name + ":" + this.BMI();
    }
}
