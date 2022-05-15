package com.fu.base.service;

import com.fu.base.entity.Portal;
import com.fu.base.service.PortalService;

import java.util.List;


public interface PortalService {

    //根据ID查询
    Portal select(Long portalId);

    //查询全部
    List<Portal> selectAll();

    //新增
    Integer insert(Portal portal);

    //更新
    Integer update(Portal portal);

    //删除
    Integer delete(Long portalId);
}
