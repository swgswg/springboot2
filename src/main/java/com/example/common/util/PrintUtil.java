package com.example.common.util;

import java.util.Arrays;

/**
 * 打印工具类
 * @author song
 */
public class PrintUtil {
    public static final String ANSI_RESET = "\u001B[0m";
    public static final String ANSI_BLACK = "\u001B[30m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";
    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_WHITE = "\u001B[37m";

    public static void print(Object ...data) {
        System.out.println(ANSI_RED + "***打印开始************************" + ANSI_RESET);
        if (data == null) {
            System.out.println("null");
        }

        for (Object o: data) {
            System.out.println(o);
        }
        System.out.println(ANSI_RED + "***打印结束************************" + ANSI_RESET);
    }
}
