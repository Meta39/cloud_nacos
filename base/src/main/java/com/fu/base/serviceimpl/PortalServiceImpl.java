package com.fu.base.serviceimpl;

import com.fu.base.entity.Portal;
import com.fu.base.dao.PortalDao;
import com.fu.base.service.PortalService;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class PortalServiceImpl implements PortalService {
    @Resource
    private PortalDao portalDao;

    //根据ID查询
    @Override
    public Portal select(Long portalId) {
        return portalDao.select(portalId);
    }

    //查询全部
    @Override
    public List<Portal> selectAll() {
        return portalDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(Portal portal) {
        return portalDao.insert(portal);
    }

    //更新
    @Override
    public Integer update(Portal portal) {
        return portalDao.update(portal);
    }

    //删除
    @Override
    public Integer delete(Long portalId) {
        return portalDao.delete(portalId);
    }
}

