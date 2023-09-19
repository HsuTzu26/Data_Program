import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.PlainDocument;

public class TxDocument extends PlainDocument {

    private static final long serialVersionUID = 10;
    int maxLength;

    // 有参构造，参数为文本框输入字符最大长度
    public TxDocument(int newMaxLength) {
        super();
        maxLength = newMaxLength;
    }

	@Override
    public void insertString(int offset, String str, AttributeSet a) throws BadLocationException {
        // 字数超出范围
        if (getLength() + str.length() > maxLength) {
            return;
        }
        // 字数在范围内
        else {
            // 调用父级方法插入字符
            super.insertString(offset, str, a);
        }
    }
}