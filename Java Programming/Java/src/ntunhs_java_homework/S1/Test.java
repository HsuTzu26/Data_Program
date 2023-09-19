package ntunhs_java_homework.S1;

import java.util.*;
import java.util.Map.Entry;

public class Test {
    public static void solve() {
        Scanner cin = new Scanner(System.in);
        int n = cin.nextInt();
        LinkedHashMap<String, Integer> mp = new LinkedHashMap<String, Integer>();
        for (int i = 1; i <= n; i++) {
            String s = cin.next();
            int g = cin.nextInt();
            mp.put(s, g);
        }
        List<Entry<String, Integer>> list = new ArrayList<Entry<String, Integer>>(mp.entrySet());
        Collections.sort(list, new Comparator<Entry<String, Integer>>() {
            public int compare(Entry<String, Integer> o1, Entry<String, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        for (Entry<String, Integer> mapp : list) {
            System.out.println(mapp.getKey() + " " + mapp.getValue());

        }
    }

    public static void main(String args[]) {
        solve();
    }
}