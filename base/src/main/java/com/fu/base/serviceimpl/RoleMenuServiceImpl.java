package com.fu.base.serviceimpl;

import com.fu.base.entity.RoleMenu;
import com.fu.base.dao.RoleMenuDao;
import com.fu.base.service.RoleMenuService;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class RoleMenuServiceImpl implements RoleMenuService {
    @Resource
    private RoleMenuDao roleMenuDao;

    //根据ID查询
    @Override
    public RoleMenu select(Long roleMenuId) {
        return roleMenuDao.select(roleMenuId);
    }

    //查询全部
    @Override
    public List<RoleMenu> selectAll() {
        return roleMenuDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(RoleMenu roleMenu) {
        return roleMenuDao.insert(roleMenu);
    }

    //更新
    @Override
    public Integer update(RoleMenu roleMenu) {
        return roleMenuDao.update(roleMenu);
    }

    //删除
    @Override
    public Integer delete(Long roleMenuId) {
        return roleMenuDao.delete(roleMenuId);
    }
}

