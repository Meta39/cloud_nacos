package com.fu.base.service;

import com.fu.common.entity.Dept;

import java.util.List;


public interface DeptService {

    //根据ID查询
    Dept select(Long deptId);

    //查询全部
    List<Dept> selectAll();

    //新增
    Integer insert(Dept dept);

    //更新
    Integer update(Dept dept);

    //删除
    Integer delete(Long deptId);
}
