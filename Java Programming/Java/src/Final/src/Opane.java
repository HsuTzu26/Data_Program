import javax.swing.JOptionPane;

public class Opane {

    public static void registerOK() {
        JOptionPane.showMessageDialog(
                Rfr.frame2,
                "註冊成功",
                "提示",
                JOptionPane.WARNING_MESSAGE);
    }

    public static void registerWrong() {
        JOptionPane.showMessageDialog(
                Rfr.frame2,
                "請確認密碼",
                "提示",
                JOptionPane.WARNING_MESSAGE);
    }

    public static void loginOK() {
        JOptionPane.showMessageDialog(
                Lfr.frame,
                "登入成功",
                "提示",
                JOptionPane.WARNING_MESSAGE);
    }
}