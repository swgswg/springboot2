package com.example.model.user;

/**
 * @author song
 */
public enum UserStatusEnum {
    OPEN(1, "启用"),
    CLOSE(2, "禁用");

    private int value;
    private String desc;

    UserStatusEnum(int value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

}
