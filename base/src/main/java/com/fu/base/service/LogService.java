package com.fu.base.service;

import com.fu.common.entity.Log;

import java.util.List;


public interface LogService {

    //根据ID查询
    Log select(String logId);

    //查询全部
    List<Log> selectAll();

    //新增
    Integer insert(Log log);
}
