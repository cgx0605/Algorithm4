package visualAccumulatorTest;

import edu.princeton.cs.algs4.StdDraw;
import org.omg.CORBA.PUBLIC_MEMBER;

/**
 * @author： chenguanxu
 * @date： 2020/3/15 11:49
 * @description： TODO
 * @version: 1.0
 */
public class VisualAccumulator {
    private double total;
    private int N;

    public VisualAccumulator(int trials,double max){
        StdDraw.setXscale(0,trials);
        StdDraw.setYscale(0,max);
        StdDraw.setPenRadius(.005);
    }

    public void addDataValue(double val){
        N++;
        total +=val;
        StdDraw.setPenColor(StdDraw.DARK_GRAY);
        StdDraw.point(N,val);
        StdDraw.setPenColor(StdDraw.RED);
        StdDraw.point(N,total/N);
    }

    public void addDataValues(double val){
        N++;
        total +=val;
    }
    public double mean(){
        return total/N;
    }

    @Override
    public String toString() {
        return "VisualAccumulator{" +
                "total=" + total +
                ", N=" + N +
                '}';
    }
}
