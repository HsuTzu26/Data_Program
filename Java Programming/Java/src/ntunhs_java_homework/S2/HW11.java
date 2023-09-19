package ntunhs_java_homework.S2;

import java.io.*;

public class HW11 {

    public static void main(String[] args) {

        try {

            File f1 = new File("d:\\student.csv");
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(
                            new FileInputStream(f1), "UTF-8"));
            File f2  = new File("d:\\score.csv");
            FileWriter fw = new FileWriter(f2);
            BufferedWriter bw = new BufferedWriter(fw);

            String str; int sum; double avg;
            String prstr = "Name,Chinese,English,Math,Sum,Average\n";

            bw.write(prstr);
            System.out.println(prstr);

            while ((str=br.readLine()) != null) {
                String[] arr = str.split(",");
                sum = Integer.parseInt(arr[1])+Integer.parseInt(arr[2])+Integer.parseInt(arr[3]);
                avg = sum / 3.0;
                str += "," + sum + "," + avg;
                bw.write(str);
                System.out.printf("%s\n",str);
                bw.newLine();
            }

            br.close();
            bw.close();

        } catch (FileNotFoundException e) {
            System.out.println("找不到檔案。");
        } catch (IOException e) {
            System.out.println("檔案讀取錯誤！");
            System.out.println("例外：" + e.getMessage());
        }

    }
}
