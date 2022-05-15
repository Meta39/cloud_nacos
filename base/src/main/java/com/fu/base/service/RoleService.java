package com.fu.base.service;

import com.fu.common.entity.Role;

import java.util.List;


public interface RoleService {

    //根据ID查询
    Role select(Long roleId);

    //查询全部
    List<Role> selectAll();

    //新增
    Integer insert(Role role);

    //更新
    Integer update(Role role);

    //删除
    Integer delete(Long roleId);
}
