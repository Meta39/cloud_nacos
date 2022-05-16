package com.fu.common.entity;

import java.util.Date;

public class Menu {

    private Long menuId;//菜单ID
    private Long parentMenuId;//父菜单ID
    private String menuName;//菜单名称
    private String menuPower;//菜单权限
    private Date createTime;//创建时间

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public Long getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(Long parentMenuId) {
        this.parentMenuId = parentMenuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getMenuPower() {
        return menuPower;
    }

    public void setMenuPower(String menuPower) {
        this.menuPower = menuPower == null ? null : menuPower.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}

