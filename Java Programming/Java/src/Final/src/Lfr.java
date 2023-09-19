import java.awt.FlowLayout;

import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Lfr {

    // 定义动作命令
    public static final String COMMAND_SIGNINBTN = "Signinbtn";
    public static final String COMMAND_REGISTER = "register";
    public static final String COMMAND_RESET = "reset";

    // 公共静态主登陆界面框
    public static JFrame frame = new JFrame("登入頁面");
    // 登陆界面组件
    public static JLabel label1 = new JLabel("用户名");
    public static JTextField username = new JTextField(10);
    public static JLabel label2 = new JLabel("密碼");
    public static JPasswordField password = new JPasswordField(10);
    public static JButton Signinbtn = new JButton("登入");
    public static JButton registerbtn = new JButton("註冊");
    public static JButton resetbtn = new JButton("重置");

    // 构造函数，创建以及初始化窗口
    public Lfr() {

        // 设置窗口大小
        frame.setSize(350, 200);
        // 设置按下右上角X号后关闭
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        // 调用函数初始化窗体的组件
        initFrame();
        // 窗口居中
        frame.setLocationRelativeTo(null);
        // 窗口可见Opane
        frame.setVisible(true);
    }

    public void initFrame() {
        // 定义面板封装文本框和标签
        JPanel panel01 = new JPanel(new FlowLayout(FlowLayout.CENTER)); // 居中面板
        panel01.add(label1);
        // 为文本框添加一个限制输入字数的方法
        username.setDocument(new TxDocument(10));
        panel01.add(username);

        JPanel panel02 = new JPanel(new FlowLayout(FlowLayout.CENTER));
        panel02.add(label2);
        password.setDocument(new TxDocument(15));
        panel02.add(password);

        // 定义面板封装按钮
        JPanel panel03 = new JPanel(new FlowLayout(FlowLayout.CENTER));
        // 按钮绑定动作命令
        Signinbtn.setActionCommand(COMMAND_SIGNINBTN);
        // 为按钮添加一个动作监听
        Signinbtn.addActionListener(new Btlistener());
        panel03.add(Signinbtn);

        registerbtn.setActionCommand(COMMAND_REGISTER);
        registerbtn.addActionListener(new Btlistener());
        panel03.add(registerbtn);

        resetbtn.setActionCommand(COMMAND_RESET);
        resetbtn.addActionListener(new Btlistener());
        panel03.add(resetbtn);

        // 箱式布局装入三个面板
        Box vBox = Box.createVerticalBox();
        vBox.add(panel01);
        vBox.add(panel02);
        vBox.add(panel03);

        // 将布局置入窗口
        frame.setContentPane(vBox);
    }

    public static void main(String[] args) {
        new Lfr();
    }

}