package demo;

/**
 * @Author:
 * @Description:
 * @Date: Created in 10:34 2021-05-11
 * @Modified By:
 **/
public class demo1 {

    /*
      方法名是一个，闯传入的参数不一样。
     @ overload 方法重载
     1、跟方法的返回类型没有关系
     2、跟参数的传入数有关系
     3、跟参数顺序、参数的类型有关系。
     */

    public  static void main(String[] args){

        int a = sum(3,5);
        System.out.println(a);
        double b = sum(3,4,"zhouge");
        System.out.println(b);
    }

    public static int sum(int a, int b ){
        return a + b;
    }

    public static int sum(int a ,String c) {
        return a;
    }

    // 参数位置不同也是不同的、返回值一样
    public static String sum(int a ,String c,int d){
        return c;
    }

    //参数个数相同、返回值一样、参数顺序不同
    public static String sum(String c, int a, int d){
        return c;
    }
    // double
    public static  double sum(int a ,int b,String c){
        System.out.println(c);
        return a + b;
    }

}

