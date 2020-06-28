package AverageTest;

import edu.princeton.cs.algs4.StdIn;
import edu.princeton.cs.algs4.StdOut;

/**
 * @author： chenguanxu
 * @date： 2020/3/13 21:55
 * @description： TODO
 * @version: 1.0
 */
public class Average {

    public static void main(String[] args) {
        double sum = 0.0;
        int cnt = 0;
        while (!StdIn.isEmpty()){

            sum += StdIn.readDouble();
            cnt++;
        }
        double avg = sum / cnt;
        StdOut.printf("Averages is %.5f",avg);
    }
}
