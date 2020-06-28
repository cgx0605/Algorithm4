package aLeetcode;

import sun.awt.SunHints;

import java.util.HashMap;

/**
 * @author： chenguanxu
 * @date： 2020/3/19 20:25
 * @description： TODO
 * @version: 1.0
 */
public class LongestPalindrome {

    public int longestPalindrome(String s) {

        int k =0;
        int length=0;

        HashMap<Character,Integer> map = new HashMap<Character, Integer>();

        for(int i=0;i<s.length();i++){

            if(map.get(s.charAt(i))==null)
                map.put(s.charAt(i),1);
            else
                map.put(s.charAt(i),map.get(s.charAt(i))+1);
        }

        for(Integer value: map.values()){

            length += value/2*2;
            if(value%2 == 1 && length%2 == 0)
                length++;
        }

        return length;
    }



    public static void main(String[] args) {
        LongestPalindrome l = new LongestPalindrome();
        System.out.println(l.longestPalindrome("cccaaa"));
    }
}
