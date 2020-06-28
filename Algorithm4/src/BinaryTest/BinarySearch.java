package BinaryTest;

import edu.princeton.cs.algs4.In;
import edu.princeton.cs.algs4.StdIn;
import edu.princeton.cs.algs4.StdOut;

import java.util.Arrays;

/**
 * @author： chenguanxu
 * @date： 2020/3/14 9:20
 * @description： TODO
 * @version: 1.0
 */
public class BinarySearch {

    public static int rank(int key ,int[] a){
        //数组必须是有序的
        int lo = a[0];
        int hi = a.length-1;
        while(lo <= hi){
            //被查的数要么存在于lo和hi之间，要么不存在
            int mid = lo + (hi-lo)/2;
            if(key < a[mid])
                hi = mid-1;
            else if(key > a[mid])
                lo = mid+1;
            else
                return  mid;
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] whitelist = new In(args[0]).readAllInts();
        Arrays.sort(whitelist);
        while (!StdIn.isEmpty()){
            //读取数值，如果不存在雨白名单中则删除
            int key = StdIn.readInt();
            if(rank(key , whitelist) < 0){
                StdOut.println(key);
            }
        }

    }
}
