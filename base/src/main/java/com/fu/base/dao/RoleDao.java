package com.fu.base.dao;

import com.fu.common.entity.Role;

import java.util.List;

public interface RoleDao {

    //根据ID查询
    Role select(Long roleId);

    //查询全部
    List<Role> selectAll();

    //新增
    int insert(Role role);

    //更新
    int update(Role role);

    //删除
    int delete(Long roleId);

}

