package aLeetcode;

import java.util.HashMap;

/**
 * @author： chenguanxu
 * @date： 2020/3/22 18:57
 * @description： TODO
 * @version: 1.0
 */
//单词规律
public class WordRule {
    public boolean wordPattern(String pattern, String str) {

        String[] s = str.split(" ");
        HashMap<Character,String> map =new HashMap<Character, String>();

        if(s.length !=pattern.length())
            return false;

        for (int i=0; i<s.length;i++){
            if(!map.containsKey(pattern.charAt(i)))
                if(!map.containsValue(s[i]))
                    map.put(pattern.charAt(i),s[i]);
                else
                    return false;
            else
            if(!map.get(pattern.charAt(i)).equals(s[i]))
                return false;

        }
        return true;

    }

    public static void main(String[] args) {
        WordRule w = new WordRule();
        String pattern="abba";
        String str = "dog cat cat dog";
        System.out.println(w.wordPattern(pattern,str));
    }
}
