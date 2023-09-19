package DataStructure;
//1-4-1 Java的類別與物件-範例
public class Java的類別與物件_範例 {

    public static void main (String[]args)
    {
        // 宣告物件變數
        Customer joe;
        // 建立物件
        joe = new Customer("張阿大","新北市"); //實體化(Instantiation)
        // 指定public成員變數
        joe.age = 37;
        // 呼叫方法
        joe.printLabel();

    }
}

class Customer {            //Customer 類別宣告
    private String name;    //成員資料 Data Member:name, address, age
    private String address;
    public int age;
    // 建構子: 使用參數設定成員資料初始值
    public Customer(String name, String a) {    //Constructor (建構子)
        this.name = name;   //設定姓名
        address = a;        //設定地址
    }
    //Method Member: getMame,...
    // 方法: 傳回姓名
    public String getName(){ return name; }
    // 方法: 傳回地址
    public String getAddress(){ return address; }
    // 方法: 顯示郵寄資料
    public void printLabel() {
        System.out.println("姓名: " + name);
        System.out.println("地址: " + address);
        System.out.println("年齡: " + age);
        System.out.println("--------------------");
    }

}
