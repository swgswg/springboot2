package com.example.common.util;

import java.util.Random;

/**
 * @author song
 */
public class StringHelper {

    /**
     * 首字母大写
     * @param str
     * @return
     */
    public static String ucfirst(String str) {
        char[] ch = str.toCharArray();
        if (ch[0] >= 'a' && ch[0] <= 'z') {
            ch[0] = (char) (ch[0] - 32);
        }
        return String.valueOf(ch);
    }

    public static String getCheckCode(int length) {
        String choice = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder result = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; ++i) {
            int index = random.nextInt(choice.length());
            char c = choice.charAt(index);
            result.append(c);
        }
        return result.toString();
    }

}
