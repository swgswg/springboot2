package com.example.common.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

/**
 * 集合工具
 * @author song
 */
public class ListUtil {
    /**
     * 去重
     * @param list
     * @param <T>
     * @return
     */
    public static <T> List<T> unique(List<T> list) {
        //初始化HashSet对象，并把list对象元素赋值给HashSet对象
        HashSet<T> set = new HashSet<>(list);
        //把List集合所有元素清空
        //把HashSet对象添加至List集合
        return new ArrayList<>(set);
    }

    /**
     * 并集
     *  将一个或多个数组的单元合并起来，一个数组中的值附加在前一个数组的后面。返回作为结果的数组。
     * @param lists
     * @param <T>
     * @return
     */
    public static <T> List<T> merge(List<T> list1, List<T> ...lists) {
        LinkedList<T> linkedList1 = new LinkedList<>(list1);
        for (List<T> list : lists) {
            linkedList1.addAll(list);
        }
        return new ArrayList<T>(linkedList1);
    }


    /**
     * 差集
     * 对比 list1 和其他一个或者多个数组，返回在 list1 中但是不在其他 array 里的值。
     * @param lists
     * @param <T>
     * @return
     */
    public static <T> List<T> diff(List<T> list1, List<T> ...lists) {
        LinkedList<T> linkedList1 = new LinkedList<>(list1);
        for (List<T> list : lists) {
            linkedList1.removeAll(list);
        }
        return new ArrayList<T>(linkedList1);
    }


    /**
     * 交集
     * 返回一个数组，该数组包含了所有在 list1 中也同时出现在所有其它参数数组中的值
     * @param list1
     * @param lists
     * @param <T>
     * @return
     */
    public static <T> List<T> intersect(List<T> list1, List<T> ...lists) {
        LinkedList<T> linkedList1 = new LinkedList<>(list1);
        for (List<T> list : lists) {
            linkedList1.retainAll(list);
        }
        return new ArrayList<T>(linkedList1);
    }

}
