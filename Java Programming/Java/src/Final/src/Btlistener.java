import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
public class Btlistener implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent e) {
        // TODO Auto-generated method stub
        String command = e.getActionCommand();

        // 按下登录按钮
        if (Lfr.COMMAND_SIGNINBTN.equals(command)) {
            // 弹出登录对话框
            Opane.loginOK();
           new MainFrame();
        }
        // 按下注册页面的注册按钮
        else if (Rfr.COMMAND_RREGISTER.equals(command)) {
            // 弹出注册对话框
            if (Arrays.equals(Rfr.conpassword.getPassword(), Lfr.password.getPassword())) {
                Opane.registerOK();
                new Lfr();
            } else {
                Opane.registerWrong();
            }
        }
        // 按下重置按钮
        else if (Lfr.COMMAND_RESET.equals(command)) {
            // 删除所有文本框的文字
            Lfr.username.setText("");
            Lfr.password.setText("");
            Rfr.conpassword.setText("");
            // 设置光标位置
            Lfr.username.requestFocus();
        }
        // 按下登录界面的注册按钮
        else if (Lfr.COMMAND_REGISTER.equals(command)) {
            // 弹出注册界面
            Rfr.register();
        }
    }
}