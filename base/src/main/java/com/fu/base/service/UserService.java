package com.fu.base.service;

import com.fu.base.entity.User;
import com.fu.base.service.UserService;

import java.security.NoSuchAlgorithmException;
import java.util.List;


public interface UserService {

    //根据ID查询
    User select(Long userId);

    //查询全部
    List<User> selectAll();

    //新增
    Integer insert(User user) throws NoSuchAlgorithmException;

    //更新
    Integer update(User user);

    //删除
    Integer delete(Long userId);
}
