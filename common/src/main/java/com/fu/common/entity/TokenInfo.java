package com.fu.common.entity;

import java.util.Set;

/**
 * 用户登录时对应token存放的用户信息
 */
public class TokenInfo{
    private String token;//token
    private Long userId;//用户ID
    private String userName;//用户名
    private Set<Dept> userDept;//用户去重后的部门集合
    private Set<Role> userRole;//用户去重后的角色集合
    private Set<Menu> userRoleMenu;//用户对应角色的去重菜单集合

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Set<Dept> getUserDept() {
        return userDept;
    }

    public void setUserDept(Set<Dept> userDept) {
        this.userDept = userDept;
    }

    public Set<Role> getUserRole() {
        return userRole;
    }

    public void setUserRole(Set<Role> userRole) {
        this.userRole = userRole;
    }

    public Set<Menu> getUserRoleMenu() {
        return userRoleMenu;
    }

    public void setUserRoleMenu(Set<Menu> userRoleMenu) {
        this.userRoleMenu = userRoleMenu;
    }
}
