package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.base.entity.UserRole;
import com.fu.base.serviceimpl.UserRoleServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 用户角色表
 */
@RestController
@RequestMapping("userRole")
public class UserRoleController {

    @Resource
    private UserRoleServiceImpl userRoleServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public UserRole select(@RequestParam Long id) {
        return userRoleServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<UserRole> selectAll() {
        return userRoleServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<UserRole> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(userRoleServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param userRole
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid UserRole userRole) {
        return userRoleServiceImpl.insert(userRole);
    }

    /**
     * 修改
     *
     * @param userRole
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid UserRole userRole) {
        return userRoleServiceImpl.update(userRole);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return userRoleServiceImpl.delete(id);
    }

}

