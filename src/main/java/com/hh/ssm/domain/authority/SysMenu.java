package com.hh.ssm.domain.authority;

import java.util.List;

public class SysMenu {

    private Integer MENU_ID;		//菜单ID
    private String MENU_NAME;	//菜单名称
    private String MENU_URL;	//链接
    private Integer PARENT_ID;	//上级菜单ID
    private String MENU_ORDER;	//排序
    private String MENU_TYPE;	//类型
    private String MENU_ATTR;	//菜单属性值
    private String AVAILABLE;
    private String target;
    private SysMenu parentMenu;
    private List<SysMenu> subMenu;
    private boolean hasMenu = false;

    public String getAVAILABLE() {
        return AVAILABLE;
    }

    public void setAVAILABLE(String AVAILABLE) {
        this.AVAILABLE = AVAILABLE;
    }

    public String getMENU_NAME() {
        return MENU_NAME;
    }

    public void setMENU_NAME(String MENU_NAME) {
        this.MENU_NAME = MENU_NAME;
    }

    public String getMENU_URL() {
        return MENU_URL;
    }

    public void setMENU_URL(String MENU_URL) {
        this.MENU_URL = MENU_URL;
    }

    public String getMENU_ORDER() {
        return MENU_ORDER;
    }

    public void setMENU_ORDER(String MENU_ORDER) {
        this.MENU_ORDER = MENU_ORDER;
    }

    public String getMENU_TYPE() {
        return MENU_TYPE;
    }

    public void setMENU_TYPE(String MENU_TYPE) {
        this.MENU_TYPE = MENU_TYPE;
    }

    public String getMENU_ATTR() {
        return MENU_ATTR;
    }

    public void setMENU_ATTR(String MENU_ATTR) {
        this.MENU_ATTR = MENU_ATTR;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public SysMenu getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(SysMenu parentMenu) {
        this.parentMenu = parentMenu;
    }

    public List<SysMenu> getSubMenu() {
        return subMenu;
    }

    public void setSubMenu(List<SysMenu> subMenu) {
        this.subMenu = subMenu;
    }

    public boolean isHasMenu() {
        return hasMenu;
    }

    public void setHasMenu(boolean hasMenu) {
        this.hasMenu = hasMenu;
    }

    public Integer getMENU_ID() {
        return MENU_ID;
    }

    public void setMENU_ID(Integer MENU_ID) {
        this.MENU_ID = MENU_ID;
    }

    public Integer getPARENT_ID() {
        return PARENT_ID;
    }

    public void setPARENT_ID(Integer PARENT_ID) {
        this.PARENT_ID = PARENT_ID;
    }
}
