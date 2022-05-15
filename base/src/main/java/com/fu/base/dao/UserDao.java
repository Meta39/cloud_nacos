package com.fu.base.dao;

import com.fu.base.entity.User;

import java.util.List;

public interface UserDao {

    //根据ID查询
    User select(Long userId);

    //查询全部
    List<User> selectAll();

    //新增
    int insert(User user);

    //更新
    int update(User user);

    //删除
    int delete(Long userId);


}

