package com.fu.base.service;

import com.fu.base.entity.RoleMenu;
import com.fu.base.service.RoleMenuService;

import java.util.List;


public interface RoleMenuService {

    //根据ID查询
    RoleMenu select(Long roleMenuId);

    //查询全部
    List<RoleMenu> selectAll();

    //新增
    Integer insert(RoleMenu roleMenu);

    //更新
    Integer update(RoleMenu roleMenu);

    //删除
    Integer delete(Long roleMenuId);
}
