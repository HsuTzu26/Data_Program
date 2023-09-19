package SelectGame.SelectGame;

import java.awt.Image;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.*;


public class MainFrame extends JFrame implements MouseListener {

    // JLabel snake,cube,ball;
    JButton snake, cube, ball;
    JPanel MainPanel;

    public MainFrame() {
        this.setSize(1100,750);  // 大小
        this.setLocationRelativeTo(null);  // 居中
        this.setUndecorated(false);  // 顯示邊框
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);  // 預設關閉
        this.setVisible(true);
        this.setResizable(false);
        this.setLayout(null);


        JLabel title = new JLabel();
        title.setBounds(400, 100, 300, 105);
        ImageIcon titleIcon = new ImageIcon("C:/Data_Program/Java/src/SelectGame/SelectGame/select.png");
        Image temp0 = titleIcon.getImage().getScaledInstance(title.getWidth(),
                title.getHeight(), titleIcon.getImage().SCALE_DEFAULT);  // 建立圖片，大小跟按鈕一樣大
        titleIcon = new ImageIcon(temp0);  // 將圖片引用為圖標
        title.setIcon(titleIcon);  // 將圖標放在按鈕上
        this.add(title);

        JPanel MainPanel = new JPanel();
        MainPanel.setLayout(null);

        snake = new JButton();  // ImageIcon:圖示
        snake.setBounds(200, 220, 200, 300);  // 設定視窗在螢幕上的(250, 220)位置出現，寬200高300
        ImageIcon snakeIcon = new ImageIcon("C:/Data_Program/Java/src/SelectGame/SelectGame/snake.jpg");
        Image temp1 = snakeIcon.getImage().getScaledInstance(snake.getWidth(),
                snake.getHeight(), snakeIcon.getImage().SCALE_DEFAULT);  // 建立圖片，大小跟按鈕一樣大
        snakeIcon = new ImageIcon(temp1);  // 將圖片引用為圖標
        snake.setIcon(snakeIcon);  // 將圖標放在按鈕上
        snake.setEnabled(false);  // false 按鈕為灰色
        snake.addMouseListener(this);
        this.add(snake);
        this.validate();
        this.repaint();
        cube = new JButton();  // ImageIcon:圖示
        cube.setBounds(450, 220, 200, 300);  // 設定視窗在螢幕上的(500, 220)位置出現，寬200高300
        ImageIcon cubeIcon = new ImageIcon("C:/Data_Program/Java/src/SelectGame/SelectGame/cube.jpg");
        Image temp2 = cubeIcon.getImage().getScaledInstance(cube.getWidth(),
                cube.getHeight(), cubeIcon.getImage().SCALE_DEFAULT);  // 建立圖片，大小跟按鈕一樣大
        cubeIcon = new ImageIcon(temp2);  // 將圖片引用為圖標
        cube.setIcon(cubeIcon);  // 將圖標放在按鈕上
        cube.setEnabled(false);  // false 按鈕為灰色
        cube.addMouseListener(this);
        this.add(cube);
        this.validate();
        this.repaint();
        ball = new JButton();  // ImageIcon:圖示
        ball.setBounds(700, 220, 200, 300);  // 設定視窗在螢幕上的(750, 220)位置出現，寬200高300
        ImageIcon ballIcon = new ImageIcon("C:/Data_Program/Java/src/SelectGame/SelectGame/ball.jpg");
        Image temp3 = ballIcon.getImage().getScaledInstance(ball.getWidth(),
                ball.getHeight(), ballIcon.getImage().SCALE_DEFAULT);  // 建立圖片，大小跟按鈕一樣大
        ballIcon = new ImageIcon(temp3);  // 將圖片引用為圖標
        ball.setIcon(ballIcon);  // 將圖標放在按鈕上
        ball.setEnabled(false);  // false 按鈕為灰色
        ball.addMouseListener(this);
        this.add(ball);
        this.validate();
        this.repaint();
    }


    public static void main(String[] args) {
        new MainFrame();

    }

    @Override
    public void mouseClicked(MouseEvent e) {
        //滑鼠點選
        if(e.getSource().equals(snake)){
            System.out.println("貪食蛇");
            // 跳轉到貪食蛇
        }else if(e.getSource().equals(cube)){
            System.out.println("俄羅斯方塊");
            // 跳轉到俄羅斯方塊
        }else if(e.getSource().equals(ball)){
            System.out.println("乒乓球");
            // 跳轉到兵乓球
        }

    }

    @Override
    public void mousePressed(MouseEvent e) {
        // TODO Auto-generated method stub

    }

    @Override
    public void mouseReleased(MouseEvent e) {
        // TODO Auto-generated method stub

    }

    @Override
    public void mouseEntered(MouseEvent e) {
        // 滑鼠移入
        if(e.getSource().equals(snake)){//e指一個事件。e.getSource()獲取事件
            //如果滑鼠移入到（snake）元件（圖片按鈕）
            snake.setEnabled(true);
        }else if(e.getSource().equals(cube)){
            cube.setEnabled(true);
        }else if(e.getSource().equals(ball)){
            ball.setEnabled(true);
        }
    }

    @Override
    public void mouseExited(MouseEvent e) {
        //滑鼠移出
        if(e.getSource().equals(snake)){
            snake.setEnabled(false);
        }else if(e.getSource().equals(cube)){
            cube.setEnabled(false);
        }else if(e.getSource().equals(ball)){
            ball.setEnabled(false);
        }
    }

}