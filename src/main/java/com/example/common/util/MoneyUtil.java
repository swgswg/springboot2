package com.example.common.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * 功能：金额计算器
 *
 * @author chuchengyi
 */
public class MoneyUtil implements Serializable {
    private static final long serialVersionUID = 2793715226687628608L;

    /**
     * 功能：金额除法计算保留小数点后两位
     */
    private static final Integer SCALE = 2;


    /**
     * 功能描述: 格式化金额，保留2位小数
     *
     * @param money  default
     * @return java.math.BigDecimal
     */
    public static BigDecimal formatMoney(BigDecimal money) {
        return money.setScale(SCALE, BigDecimal.ROUND_DOWN);
    }


    /**
     * 功能：金额相加
     *
     * @param left  左边的金额
     * @param right 右边的金额
     * @return
     */
    public static BigDecimal add(BigDecimal left, BigDecimal right) {
        BigDecimal leftMoney = new BigDecimal(left.toString());
        BigDecimal rightMoney = new BigDecimal(right.toString());
        return leftMoney.add(rightMoney).setScale(SCALE, RoundingMode.DOWN);
    }


    /**
     * 功能：金额相减
     *
     * @param left  左边的金额
     * @param right 右边的金额
     * @return
     */
    public static BigDecimal sub(BigDecimal left, BigDecimal right) {
        BigDecimal leftMoney = new BigDecimal(left.toString());
        BigDecimal rightMoney = new BigDecimal(right.toString());
        return leftMoney.subtract(rightMoney).setScale(SCALE, RoundingMode.DOWN);
    }


    /**
     * 功能描述: 向上取 0.121 0.13
     *
     * @param left  default
     * @param right  default
     * @return java.math.BigDecimal
     */
    public static BigDecimal divideCeil(BigDecimal left, BigDecimal right) {
        BigDecimal leftMoney = new BigDecimal(left.toString());
        BigDecimal rightMoney = new BigDecimal(right.toString());
        return leftMoney.divide(rightMoney, SCALE,  RoundingMode.CEILING);
    }

    /**
     * 功能：金额计算乘法
     *
     * @param left
     * @param right
     * @return
     */
    public static BigDecimal multiply(BigDecimal left, BigDecimal right) {
        BigDecimal leftMoney = new BigDecimal(left.toString());
        BigDecimal rightMoney = new BigDecimal(right.toString());
        return leftMoney.multiply(rightMoney).setScale(SCALE, RoundingMode.DOWN);
    }


    public static BigDecimal multiplyCeil(BigDecimal left, BigDecimal right) {
        BigDecimal leftMoney = new BigDecimal(left.toString());
        BigDecimal rightMoney = new BigDecimal(right.toString());
        return leftMoney.multiply(rightMoney).setScale(SCALE, RoundingMode.CEILING);
    }


    /**
     * 功能：金额相互除法 默认保存小数点后两位
     *
     * @param left
     * @param right
     * @return
     */
    public static BigDecimal divide(BigDecimal left, BigDecimal right) {
        return divide(left, right, SCALE);
    }


    /**
     * 功能：功能判断左边的数组是否大于右边数
     *
     * @param left
     * @param right
     * @return
     */
    public static boolean bigThan(BigDecimal left, BigDecimal right) {
        BigDecimal leftMoney = new BigDecimal(left.toString());
        BigDecimal rightMoney = new BigDecimal(right.toString());
        int result = leftMoney.compareTo(rightMoney);
        return result > 0;
    }


    /**
     * 功能更：判断左边的数是否大于等于右边的数
     *
     * @param left
     * @param right
     * @return
     */
    public static boolean bigEqualThan(BigDecimal left, BigDecimal right) {
        BigDecimal leftMoney = new BigDecimal(left.toString());
        BigDecimal rightMoney = new BigDecimal(right.toString());
        int result = leftMoney.compareTo(rightMoney);
        return result >= 0;
    }

    /**
     * 功能：金额计算
     *
     * @param left
     * @param right
     * @param scale
     * @return
     */
    public static BigDecimal divide(BigDecimal left, BigDecimal right, Integer scale) {
        if (scale < 0) {
            throw new IllegalArgumentException("The scale must be a positive integer or zero");
        }
        //构建左边的金额
        BigDecimal leftMoney = new BigDecimal(left.toString());
        //构建右边的金额
        BigDecimal rightMoney = new BigDecimal(right.toString());

        //构建金额计算
        return leftMoney.divide(rightMoney, scale, RoundingMode.DOWN);
    }


    /**
     * 功能：获取一组数组里面最小值
     * @param valueList
     * @return
     */
    public static BigDecimal minBigDecimal(BigDecimal... valueList) {
        BigDecimal min = new BigDecimal(Long.MAX_VALUE + "");
        for (BigDecimal value : valueList) {
            if (value.compareTo(min) <= 0) {
                min = value;
            }
        }
        return min;
    }


}
