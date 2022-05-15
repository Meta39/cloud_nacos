package com.fu.base.dao;

import com.fu.common.entity.Menu;

import java.util.List;

public interface MenuDao {

    //根据ID查询
    Menu select(Long menuId);

    //查询全部
    List<Menu> selectAll();

    //新增
    int insert(Menu menu);

    //更新
    int update(Menu menu);

    //删除
    int delete(Long menuId);

}

