package com.fu.common.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Dept {

    private Long deptId;//部门ID
    private Long parentDeptId;//父部门ID
    private String deptName;//部门名称
    private Date createTime;//创建时间

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getParentDeptId() {
        return parentDeptId;
    }

    public void setParentDeptId(Long parentDeptId) {
        this.parentDeptId = parentDeptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}

