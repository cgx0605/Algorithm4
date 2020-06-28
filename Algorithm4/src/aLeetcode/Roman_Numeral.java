package aLeetcode;

import sun.security.action.PutAllAction;

import java.util.HashMap;
import java.util.Map;

/**
 * @author： chenguanxu
 * @date： 2020/3/18 18:29
 * @description： TODO
 * @version: 1.0
 */
public class Roman_Numeral {


    public int romanToInt(String s) {


        int length = s.length();
        if(length==0)
            return 0;

        Map<Character,Integer> map = new HashMap<Character,Integer>();
        map.put('I',1);
        map.put('V',5);
        map.put('X',10);
        map.put('L',50);
        map.put('C',100);
        map.put('D',500);
        map.put('M',1000);

        int rt =map.get(s.charAt(length-1));
        for (int i=length-2;i>=0;i--){
            if(map.get(s.charAt(i))<map.get(s.charAt(i+1)))
                rt -=map.get(s.charAt(i));
            else
                rt +=map.get(s.charAt(i));
        }

        return rt;

    }



    public static void main(String[] args) {

        Roman_Numeral rn=new Roman_Numeral();
        System.out.println(rn.romanToInt("MCMXCIV"));
    }
}
