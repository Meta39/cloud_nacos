package com.fu.base.serviceimpl;

import com.fu.common.entity.Role;
import com.fu.base.dao.RoleDao;
import com.fu.base.service.RoleService;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleDao roleDao;

    //根据ID查询
    @Override
    public Role select(Long roleId) {
        return roleDao.select(roleId);
    }

    //查询全部
    @Override
    public List<Role> selectAll() {
        return roleDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(Role role) {
        return roleDao.insert(role);
    }

    //更新
    @Override
    public Integer update(Role role) {
        return roleDao.update(role);
    }

    //删除
    @Override
    public Integer delete(Long roleId) {
        return roleDao.delete(roleId);
    }
}

