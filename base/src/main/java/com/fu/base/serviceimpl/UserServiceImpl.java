package com.fu.base.serviceimpl;

import com.fu.base.entity.User;
import com.fu.base.dao.UserDao;
import com.fu.base.service.UserService;
import com.fu.common.util.RSAUtil;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    //根据ID查询
    @Override
    public User select(Long userId) {
        return userDao.select(userId);
    }

    //查询全部
    @Override
    public List<User> selectAll() {
        return userDao.selectAll();
    }

    //新增用户
    @Override
    public Integer insert(User user) throws NoSuchAlgorithmException {
        Map<String,String> publicAndPrivateKey = RSAUtil.genKeyPair();//获取一对公钥和私钥
        user.setPublicKey(publicAndPrivateKey.get("publicKey"));
        user.setPrivateKey(publicAndPrivateKey.get("privateKey"));
        return userDao.insert(user);
    }

    //更新
    @Override
    public Integer update(User user) {
        return userDao.update(user);
    }

    //删除
    @Override
    public Integer delete(Long userId) {
        return userDao.delete(userId);
    }
}

