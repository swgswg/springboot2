package com.example.common.util;

/**
 * @author song
 */
public class SnowFlake {
    /**
     * 每一部分占用的位数
     */
    private final static long SEQUENCE_BIT = 12; //序列号占用的位数
    private final static long MACHINE_BIT = 5;   //机器标识占用的位数
    private final static long DATACENTER_BIT = 5;//数据中心占用的位数

    /**
     * 每一部分的最大值
     */
//    private final static long MAX_DATACENTER_NUM = -1L ^ (-1L << DATACENTER_BIT);
    private final static long MAX_DATACENTER_NUM = ~(-1L << DATACENTER_BIT);
//    private final static long MAX_MACHINE_NUM = -1L ^ (-1L << MACHINE_BIT);
    private final static long MAX_MACHINE_NUM = ~(-1L << MACHINE_BIT);
//    private final static long MAX_SEQUENCE = -1L ^ (-1L << SEQUENCE_BIT);
    private final static long MAX_SEQUENCE = ~(-1L << SEQUENCE_BIT);

    /**
     * 每一部分向左的位移
     */
    private final static long MACHINE_LEFT = SEQUENCE_BIT;
    private final static long DATACENTER_LEFT = SEQUENCE_BIT + MACHINE_BIT;
    private final static long TIMESTMP_LEFT = DATACENTER_LEFT + DATACENTER_BIT;

    private final long startMillisecond; // 起始时间
    private final long datacenterId;  //数据中心
    private final long workerId;     //机器标识
    private long sequence = 0L; //序列号
    private long lastStmp = -1L;//上一次时间戳


    public SnowFlake(long startMillisecond, long workerId, long datacenterId) {
        if (datacenterId > MAX_DATACENTER_NUM || datacenterId < 0) {
            throw new IllegalArgumentException("datacenterId can't be greater than MAX_DATACENTER_NUM or less than 0");
        }
        if (workerId > MAX_MACHINE_NUM || workerId < 0) {
            throw new IllegalArgumentException("workerId can't be greater than MAX_MACHINE_NUM or less than 0");
        }
        this.startMillisecond = startMillisecond;
        this.datacenterId = datacenterId;
        this.workerId = workerId;
    }

    /**
     * 产生下一个ID
     *
     * @return
     */
    public synchronized long nextId() {
        long currStmp = this.getCurrentTimeMillis();
        if (currStmp < this.lastStmp) {
            throw new RuntimeException("Clock moved backwards.  Refusing to generate id");
        }

        if (currStmp == this.lastStmp) {
            //相同毫秒内，序列号自增
            this.sequence = (this.sequence + 1) & MAX_SEQUENCE;
            //同一毫秒的序列数已经达到最大
            if (this.sequence == 0L) {
                currStmp = getNextMill();
            }
        } else {
            //不同毫秒内，序列号置为0
            this.sequence = 0L;
        }

        this.lastStmp = currStmp;

        return (currStmp - this.startMillisecond) << TIMESTMP_LEFT //时间戳部分
                | this.datacenterId << DATACENTER_LEFT       //数据中心部分
                | this.workerId << MACHINE_LEFT             //机器标识部分
                | this.sequence;                             //序列号部分
    }

    private long getNextMill() {
        long mill = this.getCurrentTimeMillis();
        while (mill <= this.lastStmp) {
            mill = this.getCurrentTimeMillis();
        }
        return mill;
    }

    private long getCurrentTimeMillis() {
        return System.currentTimeMillis();
    }

//    public static void main(String[] args) {
//        SnowFlake snowFlake = new SnowFlake(DateTimeUtil.getCurrentMillisecond(),2, 3);
//        System.out.println(snowFlake.nextId());
//    }
}
