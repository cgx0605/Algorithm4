package aLeetcode;

import java.util.Arrays;

/**
 * @author： chenguanxu
 * @date： 2020/3/20 18:24
 * @description： TODO
 * @version: 1.0
 */
public class LeastNumbers {

    public int[] getLeastNumbers(int[] arr, int k) {
         Arrays.sort(arr);
         return Arrays.copyOfRange(arr, 0, k);
    }

}

