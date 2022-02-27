package demo;

import java.awt.*;

/**
 * @Author:
 * @Description:
 * @Date: Created in 23:20 2021-05-17
 * @Modified By:
 **/

/*

如果是整数类型，则默认为 0
如果是浮点类型，则默认为 0.0
如果是字符类型  则默认为‘\u0000’
如果布尔类型  则默认为flase;

 */


public class demo05ArrayUse {

    public  static void main(String[] args){

        //动态初始化一个数组
        int[] array = new int[3];

        System.out.println(array);
        System.out.println(array[0]);
        System.out.println(array[1]);
        System.out.println(array[2]);

        // 数组赋值
        array[1] = 123;
        System.out.println(array[1]);
    }


}
