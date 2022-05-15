package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.base.entity.RoleMenu;
import com.fu.base.serviceimpl.RoleMenuServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 角色菜单表
 */
@RestController
@RequestMapping("roleMenu")
public class RoleMenuController {

    @Resource
    private RoleMenuServiceImpl roleMenuServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public RoleMenu select(@RequestParam Long id) {
        return roleMenuServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<RoleMenu> selectAll() {
        return roleMenuServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<RoleMenu> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(roleMenuServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param roleMenu
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid RoleMenu roleMenu) {
        return roleMenuServiceImpl.insert(roleMenu);
    }

    /**
     * 修改
     *
     * @param roleMenu
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid RoleMenu roleMenu) {
        return roleMenuServiceImpl.update(roleMenu);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return roleMenuServiceImpl.delete(id);
    }

}

