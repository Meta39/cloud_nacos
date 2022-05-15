package com.fu.base.dao;

import com.fu.common.entity.Dept;

import java.util.List;

public interface DeptDao {

    //根据ID查询
    Dept select(Long deptId);

    //查询全部
    List<Dept> selectAll();

    //新增
    int insert(Dept dept);

    //更新
    int update(Dept dept);

    //删除
    int delete(Long deptId);

}

