package com.fu.base.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.common.entity.Log;
import com.fu.base.serviceimpl.LogServiceImpl;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 日志表
 */
@RestController
@RequestMapping("log")
public class LogController {

    @Resource
    private LogServiceImpl logServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @GetMapping("select")
    public Log select(@RequestParam String id) {
        return logServiceImpl.select(id);
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @GetMapping("selectPage")
    public PageSerializable<Log> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(logServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param log
     */
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid Log log) {
        return logServiceImpl.insert(log);
    }

}

