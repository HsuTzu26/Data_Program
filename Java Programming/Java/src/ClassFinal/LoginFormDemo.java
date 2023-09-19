package ClassFinal;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.lang.Exception;

class CreateLoginForm extends JFrame implements ActionListener {

    JButton b1;
    JPanel newPanel;
    JLabel userLabel, passLabel;
    final JTextField textField1, textField2;

    CreateLoginForm() {

        userLabel = new JLabel();
        userLabel.setText("使用者姓名");

        textField1 = new JTextField(15);

        passLabel = new JLabel();
        passLabel.setText("密碼");

        textField2 = new JPasswordField(15);

        b1 = new JButton("送出");

        newPanel = new JPanel(new GridLayout(6, 3));
        newPanel.add(userLabel);
        newPanel.add(textField1);
        newPanel.add(passLabel);
        newPanel.add(textField2);
        newPanel.add(b1);

        add(newPanel, BorderLayout.CENTER);
        b1.addActionListener(this);
        setTitle("登入頁面");
    }

    public void actionPerformed(ActionEvent ae) {
        String userValue = textField1.getText();
        String passValue = textField2.getText();

        // 預設帳密
        if (userValue.equals("user1") && passValue.equals("pass1")) {

            NewPage page = new NewPage();

            page.setVisible(true);

            JLabel wel_label = new JLabel("Welcome: " + userValue);
            page.getContentPane().add(wel_label);
        } else {
            System.out.println("Please enter valid username and password");

            NewPage2 page = new NewPage2();

            page.setVisible(true);

            JLabel wel_label = new JLabel("fail: " + userValue);
            page.getContentPane().add(wel_label);
        }
    }
}

class LoginFormDemo {
    public static void main(String arg[]) {
        try {
            CreateLoginForm form = new CreateLoginForm();
            form.setSize(900, 300);
            int windowWidth = form.getWidth();
            int windowHeight = form.getHeight();
            Toolkit kit = Toolkit.getDefaultToolkit();
            Dimension screenSize = kit.getScreenSize();
            int screenWidth = screenSize.width;
            int screenHeight = screenSize.height;
            form.setLocation(screenWidth/2-windowWidth/2, screenHeight/2-windowHeight/2);

            form.setVisible(true);

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }
}