package ntunhs_java_homework.S1;

public class Factorial { //Topic requirement: The result of 1! + ... + 20! = ?
    public static void main (String[]args){
        int stratum = 0, i = 0;
        double result = 1;//Double has much more store space than integer. Double has 64bytes, Integer has 32bytes

        for(i = 1; i <=20; i++){
            stratum++;
            result *= i;

            System.out.println(stratum + "!= " + result);
        }

//        while(i < 20){
//
//            i++;
//            stratum++;
//            result*= i;
//
//            System.out.println(stratum + "!= " + result);
//
//            if(stratum==20) break;
//        }
//
//        do{
//            i++;
//            stratum++;
//            result*=i;
//
//            System.out.println(stratum + "!= " + result);
//            if(stratum==20) break;
//        }while(i<20);
    }
}
