package com.fu.base.controller;

import com.fu.common.aop.LogAnnotate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageSerializable;
import com.fu.base.entity.User;
import com.fu.base.serviceimpl.UserServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * 用户表
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Resource
    private UserServiceImpl userServiceImpl;

    /**
     * 根据ID查询
     *
     * @param id
     */
    @LogAnnotate()
    @GetMapping("select")
    public User select(@RequestParam Long id) {
        return userServiceImpl.select(id);
    }

    /**
     * 查询全部
     */
    @LogAnnotate()
    @GetMapping("selectAll")
    public List<User> selectAll() {
        return userServiceImpl.selectAll();
    }

    /**
     * 查询全部（分页）
     *
     * @param pageNum  起始页
     * @param pageSize 每页数据量
     */
    @LogAnnotate()
    @GetMapping("selectPage")
    public PageSerializable<User> selectPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return PageSerializable.of(userServiceImpl.selectAll());
    }

    /**
     * 新增
     *
     * @param user
     */
    @LogAnnotate()
    @PostMapping("insert")
    public Integer insert(@RequestBody @Valid User user) throws NoSuchAlgorithmException {
        return userServiceImpl.insert(user);
    }

    /**
     * 修改
     *
     * @param user
     */
    @LogAnnotate()
    @PostMapping("update")
    public Integer update(@RequestBody @Valid User user) {
        return userServiceImpl.update(user);
    }

    /**
     * 删除
     *
     * @param id
     */
    @LogAnnotate()
    @PostMapping("delete")
    public Integer delete(@RequestParam Long id) {
        return userServiceImpl.delete(id);
    }

}

