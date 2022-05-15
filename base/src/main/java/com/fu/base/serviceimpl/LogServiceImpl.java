package com.fu.base.serviceimpl;

import com.fu.common.entity.Log;
import com.fu.base.dao.LogDao;
import com.fu.base.service.LogService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

@Service
public class LogServiceImpl implements LogService {
    @Resource
    private LogDao logDao;

    //根据ID查询
    @Override
    public Log select(String logId) {
        return logDao.select(logId);
    }

    //查询全部
    @Override
    public List<Log> selectAll() {
        return logDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(Log log) {
        log.setLogId(UUID.randomUUID().toString());
        return logDao.insert(log);
    }
}

