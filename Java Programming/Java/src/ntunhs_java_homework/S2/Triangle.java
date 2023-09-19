package ntunhs_java_homework.S2;

class Triangle {
    private int base;
    private int height;
    double ans;

    public Triangle(){
        this.base=0;
        this.height=0;
    }
    public Triangle(int b, int h){
        this.base=b;
        this.height=h;
    }

    public void setBase(int base) {
        this.base=base;
    }
    public void setHeight(int height) {
        this.height=height;
    }
    public int getBase() {
        return this.base;
    }
    public int getHeight() {
        return this.height;
    }

    void Area() {
        ans = (base * height) / 2.0;
        System.out.println("底=" + base + ",高=" + height + "：三角形面積=" + ans
                + '\n');
    }
    double Area(int i) {
        return ans = (i * height) / 2.0;
    }

    double Area(int i, int j) {
        return ans = (i * j) / 2.0;
    }

    double trigonometric() { //不輸入直角三角型二個短邊長
        //Math.pow(底數, 次方)：Java計算次方的方法，回傳double值
        //二邊長的平方相加等於鈄邊平方
        height = getHeight();
        base = getBase();
        return Math.sqrt(height*height + base*base); //回傳鈄邊長
    }
    double trigonometric(double a, double b) { //輸入直角三角型二個短邊長
        //Math.pow(底數, 次方)：Java計算次方的方法，回傳double值
        //二邊長的平方相加等於鈄邊平方

        return Math.sqrt(a*a + b*b);//回傳鈄邊長
    }
}

class Homework {
    public static void main(String[] args) {
        // 實作類別物件
        Triangle triangle = new Triangle(3,4);

//        triangle.setBase(10);
        triangle.setBase(5);
        triangle.setHeight(12);
        System.out.println("底=" + triangle.getBase() + ",高=" + triangle.getHeight()) ;

        System.out.println("不具回傳值的方法，沒有引數：");
        triangle.Area();
        System.out.println("具有回傳值，單一引數：");
        System.out.println("三角形面積=" + triangle.Area(4) + '\n');
        System.out.println("具有回傳值，2個引數：");
        System.out.println("三角形面積=" + triangle.Area(4, 10));

        System.out.println("直三角形斜邊(不具輸入)=" + triangle.trigonometric());
        System.out.println("直角三角形斜邊(具輸入)=" + triangle.trigonometric(5,12));

    }
}