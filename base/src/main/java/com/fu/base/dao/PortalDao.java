package com.fu.base.dao;

import com.fu.base.entity.Portal;

import java.util.List;

public interface PortalDao {

    //根据ID查询
    Portal select(Long portalId);

    //查询全部
    List<Portal> selectAll();

    //新增
    int insert(Portal portal);

    //更新
    int update(Portal portal);

    //删除
    int delete(Long portalId);

}

