package aLeetcode;

import edu.princeton.cs.algs4.Bag;
import edu.princeton.cs.algs4.Stack;

import java.util.HashMap;

/**
 * @author： chenguanxu
 * @date： 2020/3/15 21:10
 * @description： TODO
 * @version: 1.0
 */
public class TwoSum {

    public int[] twosum(int[] nums,int target){

        HashMap<Integer,Integer> map = new HashMap<>();

        for(int i=0;i<nums.length;i++){
            if(map.get(nums[i]) != null){
                int[] result ={map.get(nums[i]),i};
            }

            map.put(target-nums[i],i);

        }

        int[] result={};
        return result;


    }

}





















