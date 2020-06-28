package aLeetcode;

/**
 * @author： chenguanxu
 * @date： 2020/3/25 19:56
 * @description： TODO
 * @version: 1.0
 */

/**
 * 三维立体图形表面积
 */
public class SurfaceAreaOf3D {

    public int surfaceArea(int[][] grid) {

        int n=grid.length;
        int area=0;
        for(int i=0;i<n;i++)
            for (int j=0;j<n;j++){
                int temp = grid[i][j];
                if(temp>0){
                    area += temp*4 + 2;
                    area -= i>0?Math.min(temp,grid[i-1][j])*2:0;
                    area -= j>0?Math.min(temp,grid[i][j-1])*2:0;
                }
            }

        return area;
    }
}
