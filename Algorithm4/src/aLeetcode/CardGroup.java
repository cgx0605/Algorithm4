package aLeetcode;

import edu.princeton.cs.algs4.Count;
import edu.princeton.cs.algs4.In;
import sun.awt.SunHints;

import java.util.*;

/**
 * @author： chenguanxu
 * @date： 2020/3/21 21:33
 * @description： TODO
 * @version: 1.0
 */
public class CardGroup {

    public boolean hasGroupsSizeX(int[] deck) {

          int N = deck.length;
          int[] count = new int[10000];
          for(int c: deck)
              count[c]++;

        List<Integer> values = new ArrayList<Integer>();
        for(int value:count)
            if(value==1)
                return false;
            else if(value >= 2)
            values.add(value);
         if(values.isEmpty()){
             return false;
         }

        for(int i=2;i<=N;i++){
            if(N%i ==0){
                int j=0;
                for (Integer Value:values) {
                    if (Value % i == 0) {
                        j++;
                        continue;
                    }
                    else
                        break;
                }
                if(j==values.size())
                    return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {

        CardGroup c = new CardGroup();
        int[] desk={1,2,3,4,4,3,2,1};

        System.out.println(c.hasGroupsSizeX(desk));
    }
}
