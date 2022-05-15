package com.fu.base.service;

import com.fu.base.entity.UserDept;
import com.fu.base.service.UserDeptService;

import java.util.List;


public interface UserDeptService {

    //根据ID查询
    UserDept select(Long userDeptId);

    //查询全部
    List<UserDept> selectAll();

    //新增
    Integer insert(UserDept userDept);

    //更新
    Integer update(UserDept userDept);

    //删除
    Integer delete(Long userDeptId);
}
