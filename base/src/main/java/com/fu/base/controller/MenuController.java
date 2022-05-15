package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.common.entity.Menu;
import com.fu.base.serviceimpl.MenuServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 菜单表
 */
@RestController
@RequestMapping("menu")
public class MenuController {

    @Resource
    private MenuServiceImpl menuServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public Menu select(@RequestParam Long id) {
        return menuServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<Menu> selectAll() {
        return menuServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<Menu> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(menuServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param menu
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid Menu menu) {
        return menuServiceImpl.insert(menu);
    }

    /**
     * 修改
     *
     * @param menu
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid Menu menu) {
        return menuServiceImpl.update(menu);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return menuServiceImpl.delete(id);
    }

}

