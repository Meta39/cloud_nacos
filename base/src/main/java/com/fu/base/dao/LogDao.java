package com.fu.base.dao;

import com.fu.common.entity.Log;

import java.util.List;

public interface LogDao {

    //根据ID查询
    Log select(String logId);

    //查询全部
    List<Log> selectAll();

    //新增
    int insert(Log log);

}

