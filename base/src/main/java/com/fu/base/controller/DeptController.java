package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.common.entity.Dept;
import com.fu.base.serviceimpl.DeptServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 部门表
 */
@RestController
@RequestMapping("dept")
public class DeptController {

    @Resource
    private DeptServiceImpl deptServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public Dept select(@RequestParam Long id) {
        return deptServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<Dept> selectAll() {
        return deptServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<Dept> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(deptServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param dept
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid Dept dept) {
        return deptServiceImpl.insert(dept);
    }

    /**
     * 修改
     *
     * @param dept
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid Dept dept) {
        return deptServiceImpl.update(dept);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return deptServiceImpl.delete(id);
    }

}

