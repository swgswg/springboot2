package com.example.model.menu;

/**
 * @author song
 */

public enum MenuTypeEnum {
    CATALOG(1, "目录"),
    MENU(2, "菜单"),
    BUTTON(2, "按钮"),
    ;

    private int value;
    private String desc;

    MenuTypeEnum(int value, String desc) {
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
