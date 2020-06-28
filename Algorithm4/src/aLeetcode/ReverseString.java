package aLeetcode;

/**
 * @author： chenguanxu
 * @date： 2020/3/27 18:00
 * @description： TODO
 * @version: 1.0
 */
public class ReverseString {

    public void reverseString(char[] s) {
        int length = s.length;
        char temp;

        for (int i=0;i<length/2;i++){
            temp=s[i];
            s[i] = s[length-1-i];
            s[length-1-i] = temp;

        }
    }
}
