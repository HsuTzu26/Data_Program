package ntunhs_java_homework.S2;

import java.io.*;

/**
 * 輸入資料夾的路徑, 顯示得該資料夾下的所有檔案
 *
 * @author Lupin
 **/
public class SearchExeInJava {

    public static void main(String[] args) {
        // create new file
        String folderPath = "C:\\Windows";
        getFileList(folderPath);
    }

    public static void getFileList(String folderPath) {
        // create new filename filter
        FilenameFilter filter = new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                if (name.lastIndexOf('.') > 0) {
                    // get last index for '.' char
                    int lastIndex = name.lastIndexOf('.');

                    // get extension
                    String str = name.substring(lastIndex);

                    // match path name extension
                    if (str.equals(".exe")) {
                        return true;
                    }
                }
                return false;
            }
        };
        StringBuffer fileList = new StringBuffer();
        try {
            java.io.File folder = new java.io.File(folderPath);
            String[] list = folder.list(filter);
            int num = list.length;
            for (int i = 0; i < list.length; i++) {
                File tempFile = new File(folderPath + "\\" + list[i]);
                if (tempFile.isDirectory())
                    System.out.println("FLODER:" + list[i]);
                else
                    System.out.println("DATA:" + list[i]);
            }
            System.out.println(num + "items");
        } catch (Exception e) {
            System.out.println("The(" + folderPath + ")is not exist.");
        }
    }
}