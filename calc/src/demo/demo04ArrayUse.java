package demo;

/**
 * @Author:
 * @Description:
 * @Date: Created in 23:14 2021-05-17
 * @Modified By:
 **/



/*
二进制： 01
十进制： 0123456789
十六进制： 0123456789abcdef

访问数组元素的格式

 */


public class demo04ArrayUse {


    public static void main(String[] args){

        //静态初始化省略欧式
        int[] array = {10, 20 ,30};

        System.out.println(array); //内存哈希值 [I@73035e27 内存地址
        System.out.println(array[0]); //内存哈希值 [I@73035e27 内存地址
        System.out.println(array[1]); //内存哈希值 [I@73035e27 内存地址
        System.out.println(array[2]); //内存哈希值 [I@73035e27 内存地址


    }
}
