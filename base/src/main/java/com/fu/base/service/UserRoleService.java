package com.fu.base.service;

import com.fu.base.entity.UserRole;
import com.fu.base.service.UserRoleService;

import java.util.List;


public interface UserRoleService {

    //根据ID查询
    UserRole select(Long userRoleId);

    //查询全部
    List<UserRole> selectAll();

    //新增
    Integer insert(UserRole userRole);

    //更新
    Integer update(UserRole userRole);

    //删除
    Integer delete(Long userRoleId);
}
