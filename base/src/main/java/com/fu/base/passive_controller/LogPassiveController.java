package com.fu.base.passive_controller;

import com.fu.base.serviceimpl.LogServiceImpl;
import com.fu.common.aop.IgnoreResAnnotate;
import com.fu.common.entity.Log;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 被openfeign调用的日志接口
 */
@RestController
@RequestMapping("logPassive")
public class LogPassiveController {

    @Resource
    private LogServiceImpl logServiceImpl;

    /**
     * 被openfeign调用的日志新增接口
     * @param log 日志对象
     * @return
     */
    @IgnoreResAnnotate  //不返回统一Res泛型对象
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid Log log) {
        return logServiceImpl.insert(log);
    }

    /**
     * 被openfeign调用的日志查询接口
     * @param id 日志id
     * @return
     */
    @IgnoreResAnnotate  //不返回统一Res泛型对象
    @GetMapping("select")
    public Log select(@RequestParam String id) {
        return logServiceImpl.select(id);
    }
}
