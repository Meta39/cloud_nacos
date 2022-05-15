package com.fu.base.entity;


public class UserDept {

    private Long userDeptId;//用户部门ID
    private Long userId;//用户ID
    private Long deptId;//部门ID

    public Long getUserDeptId() {
        return userDeptId;
    }

    public void setUserDeptId(Long userDeptId) {
        this.userDeptId = userDeptId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    @Override
    public String toString() {
        return "UserDept{" +
                "userDeptId=" + userDeptId +
                ", userId=" + userId +
                ", deptId=" + deptId +
                '}';
    }
}

