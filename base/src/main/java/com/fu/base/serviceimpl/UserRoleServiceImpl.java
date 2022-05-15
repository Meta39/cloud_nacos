package com.fu.base.serviceimpl;

import com.fu.base.entity.UserRole;
import com.fu.base.dao.UserRoleDao;
import com.fu.base.service.UserRoleService;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Resource
    private UserRoleDao userRoleDao;

    //根据ID查询
    @Override
    public UserRole select(Long userRoleId) {
        return userRoleDao.select(userRoleId);
    }

    //查询全部
    @Override
    public List<UserRole> selectAll() {
        return userRoleDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(UserRole userRole) {
        return userRoleDao.insert(userRole);
    }

    //更新
    @Override
    public Integer update(UserRole userRole) {
        return userRoleDao.update(userRole);
    }

    //删除
    @Override
    public Integer delete(Long userRoleId) {
        return userRoleDao.delete(userRoleId);
    }
}

