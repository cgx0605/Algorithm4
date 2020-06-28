package aLeetcode;


/**
 * @author： chenguanxu
 * @date： 2020/3/17 18:45
 * @description： TODO
 * @version: 1.0
 */
public class PalindromeNumber {

    public boolean isPalindrome(int x) {

        if(x<0)
            return false;

        int reversed_x = 0;

        while (x != 0) {
            int temp = reversed_x * 10 + x % 10;
            x = x / 10;
            //增加了这么一个小细节，如果temp发生溢出数值就会改变，那么就会返回0
            if (temp / 10 != reversed_x) {
                reversed_x = 0;
                return false;
            }
            reversed_x = temp;
        }

        return  reversed_x == x;


    }

    public static void main(String[] args) {
        PalindromeNumber p = new PalindromeNumber();
        boolean test = p.isPalindrome(1221);
        System.out.println(test);
    }

}
