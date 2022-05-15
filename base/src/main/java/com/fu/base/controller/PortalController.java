package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.base.entity.Portal;
import com.fu.base.serviceimpl.PortalServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 门户表
 */
@RestController
@RequestMapping("portal")
public class PortalController {

    @Resource
    private PortalServiceImpl portalServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public Portal select(@RequestParam Long id) {
        return portalServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<Portal> selectAll() {
        return portalServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<Portal> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(portalServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param portal
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid Portal portal) {
        return portalServiceImpl.insert(portal);
    }

    /**
     * 修改
     *
     * @param portal
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid Portal portal) {
        return portalServiceImpl.update(portal);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return portalServiceImpl.delete(id);
    }

}

