package com.fu.base.dao;

import com.fu.base.entity.RoleMenu;

import java.util.List;

public interface RoleMenuDao {

    //根据ID查询
    RoleMenu select(Long roleMenuId);

    //查询全部
    List<RoleMenu> selectAll();

    //新增
    int insert(RoleMenu roleMenu);

    //更新
    int update(RoleMenu roleMenu);

    //删除
    int delete(Long roleMenuId);

    //登录查询角色菜单信息
    List<RoleMenu> selectLoginRoleMenu(Long roleId);

}

