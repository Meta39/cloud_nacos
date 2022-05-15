package com.fu.base.serviceimpl;

import com.fu.common.entity.Menu;
import com.fu.base.dao.MenuDao;
import com.fu.base.service.MenuService;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuDao menuDao;

    //根据ID查询
    @Override
    public Menu select(Long menuId) {
        return menuDao.select(menuId);
    }

    //查询全部
    @Override
    public List<Menu> selectAll() {
        return menuDao.selectAll();
    }

    //新增
    @Override
    public Integer insert(Menu menu) {
        return menuDao.insert(menu);
    }

    //更新
    @Override
    public Integer update(Menu menu) {
        return menuDao.update(menu);
    }

    //删除
    @Override
    public Integer delete(Long menuId) {
        return menuDao.delete(menuId);
    }
}

