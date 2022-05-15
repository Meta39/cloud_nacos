package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.base.entity.UserDept;
import com.fu.base.serviceimpl.UserDeptServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 用户部门表
 */
@RestController
@RequestMapping("userDept")
public class UserDeptController {

    @Resource
    private UserDeptServiceImpl userDeptServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public UserDept select(@RequestParam Long id) {
        return userDeptServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<UserDept> selectAll() {
        return userDeptServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<UserDept> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(userDeptServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param userDept
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid UserDept userDept) {
        return userDeptServiceImpl.insert(userDept);
    }

    /**
     * 修改
     *
     * @param userDept
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid UserDept userDept) {
        return userDeptServiceImpl.update(userDept);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return userDeptServiceImpl.delete(id);
    }

}

