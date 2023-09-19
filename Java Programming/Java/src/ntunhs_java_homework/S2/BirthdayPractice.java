package ntunhs_java_homework.S2;

//Birthday類別實作
class Birthday   // Birthday類別宣告
{  // 成員資料
    public int day;
    public int month;
    public int year;
    // 成員方法: 輸出成員資料的出生年月日
    public void printBirthday()
    {
        System.out.println(year+"年"+month+"月"+day+"日");
    }
    public void setBirthday(int year, int month, int day){
        this.year=year;
        this.month=month;
        this.day=day;
    }
}
// 主程式類別
public class BirthdayPractice
{   // 主程式
    public static void main(String[] args)
    {   // 宣告Birthday類別型態的變數
        Birthday andy,michael;
        andy = new Birthday();  // 建立物件
        michael = new Birthday();
        andy.year = 62;
        andy.month =7;
        andy.day = 23;
        michael.year = 89;
        michael.month =9;
        michael.day = 10;
        // 呼叫物件的實例方法
        System.out.print("Andy的出生年月日= ");
        andy.printBirthday();
        System.out.print("Michael的出生年月日= ");
        michael.printBirthday();
    }
}
