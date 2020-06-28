package counterTest;

/**
 * @author： chenguanxu
 * @date： 2020/3/15 11:29
 * @description： TODO
 * @version: 1.0
 */
public class Counter {

    private final String name;
    private int count;

    public Counter(String id){
        name = id;
    }

    public void increment(){
        count++;
    }
    public  int tally(){
        return count;
    }

    @Override
    public String toString() {
        return "Counter{" +
                "name='" + name + '\'' +
                ", count=" + count +
                '}';
    }
}
