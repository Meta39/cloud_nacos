package com.fu.base.serviceimpl;

import com.fu.base.entity.UserDept;
import com.fu.base.dao.UserDeptDao;
import com.fu.base.service.UserDeptService;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class UserDeptServiceImpl implements UserDeptService {
    @Resource
    private UserDeptDao userDeptDao;

    //根据ID查询
    @Override
    public UserDept select(Long userDeptId) {
        return userDeptDao.select(userDeptId);
    }

    //查询全部
    @Override
    public List<UserDept> selectAll() {
        return userDeptDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(UserDept userDept) {
        return userDeptDao.insert(userDept);
    }

    //更新
    @Override
    public Integer update(UserDept userDept) {
        return userDeptDao.update(userDept);
    }

    //删除
    @Override
    public Integer delete(Long userDeptId) {
        return userDeptDao.delete(userDeptId);
    }
}

