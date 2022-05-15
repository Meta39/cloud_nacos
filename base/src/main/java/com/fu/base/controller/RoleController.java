package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.common.entity.Role;
import com.fu.base.serviceimpl.RoleServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 角色表
 */
@RestController
@RequestMapping("role")
public class RoleController {

    @Resource
    private RoleServiceImpl roleServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public Role select(@RequestParam Long id) {
        return roleServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<Role> selectAll() {
        return roleServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<Role> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(roleServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param role
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid Role role) {
        return roleServiceImpl.insert(role);
    }

    /**
     * 修改
     *
     * @param role
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid Role role) {
        return roleServiceImpl.update(role);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return roleServiceImpl.delete(id);
    }

}

