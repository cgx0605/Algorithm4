package aLeetcode;

import java.util.Stack;

/**
 * @author： chenguanxu
 * @date： 2020/3/16 19:54
 * @description： TODO
 * @version: 1.0
 */
public class IntegerInversion {

    public int reverse(int x) {

        long temp = 0;

        while(x != 0){
             temp = temp*10 + x%10;
            x = x/10;
        }

        if(temp>Integer.MAX_VALUE || temp<Integer.MIN_VALUE)
            return 0;
        return (int) temp;
    }

    public static void main(String[] args) {
        int imax=Integer.MAX_VALUE;
        int imin=Integer.MIN_VALUE;

        int a=imax+1;
        int b=imin-1;
        System.out.println("int类型Max："+imax+"int类型Min"+imin);
        System.out.println("向上溢出"+a);
        System.out.println("向下溢出"+b);
    }
}
