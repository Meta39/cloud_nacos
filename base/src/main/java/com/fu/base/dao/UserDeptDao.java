package com.fu.base.dao;

import com.fu.base.entity.UserDept;

import java.util.List;

public interface UserDeptDao {

    //根据ID查询
    UserDept select(Long userDeptId);

    //查询全部
    List<UserDept> selectAll();

    //新增
    int insert(UserDept userDept);

    //更新
    int update(UserDept userDept);

    //删除
    int delete(Long userDeptId);

    //登录查询用户部门信息
    List<UserDept> selectLoginUserDept(Long userId);

}

