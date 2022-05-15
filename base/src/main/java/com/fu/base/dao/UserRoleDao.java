package com.fu.base.dao;

import com.fu.base.entity.UserRole;

import java.util.List;

public interface UserRoleDao {

    //根据ID查询
    UserRole select(Long userRoleId);

    //查询全部
    List<UserRole> selectAll();

    //新增
    int insert(UserRole userRole);

    //更新
    int update(UserRole userRole);

    //删除
    int delete(Long userRoleId);

    //登录查询用户角色信息
    List<UserRole> selectLoginUserRole(Long userId);

}

