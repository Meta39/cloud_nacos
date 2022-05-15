package com.fu.base.serviceimpl;

import com.fu.common.entity.Dept;
import com.fu.base.dao.DeptDao;
import com.fu.base.service.DeptService;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class DeptServiceImpl implements DeptService {
    @Resource
    private DeptDao deptDao;

    //根据ID查询
    @Override
    public Dept select(Long deptId) {
        return deptDao.select(deptId);
    }

    //查询全部
    @Override
    public List<Dept> selectAll() {
        return deptDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(Dept dept) {
        return deptDao.insert(dept);
    }

    //更新
    @Override
    public Integer update(Dept dept) {
        return deptDao.update(dept);
    }

    //删除
    @Override
    public Integer delete(Long deptId) {
        return deptDao.delete(deptId);
    }
}

