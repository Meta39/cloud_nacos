package com.fu.base.service;

import com.fu.common.entity.Menu;

import java.util.List;


public interface MenuService {

    //根据ID查询
    Menu select(Long menuId);

    //查询全部
    List<Menu> selectAll();

    //新增
    Integer insert(Menu menu);

    //更新
    Integer update(Menu menu);

    //删除
    Integer delete(Long menuId);
}
