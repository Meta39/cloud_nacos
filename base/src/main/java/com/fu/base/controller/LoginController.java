package com.fu.base.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fu.base.dao.*;
import com.fu.base.entity.*;
import com.fu.common.aop.LogAnnotate;
import com.fu.common.entity.Dept;
import com.fu.common.entity.Menu;
import com.fu.common.entity.Role;
import com.fu.common.entity.TokenInfo;
import com.fu.common.res.Err;
import com.fu.common.util.RSAUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;

@RestController
public class LoginController {
    @Value("${token-overtime}")
    private int tokenOvertime;
    @Resource
    RedisTemplate redisTemplate;
    @Resource
    UserDao userDao;
    @Resource
    DeptDao deptDao;
    @Resource
    UserDeptDao userDeptDao;
    @Resource
    RoleDao roleDao;
    @Resource
    UserRoleDao userRoleDao;
    @Resource
    MenuDao menuDao;
    @Resource
    RoleMenuDao roleMenuDao;

    /**
     * 校验用户ID是否存在，存在则返回公钥
     * @param userId 用户ID
     * @return
     */
    @PostMapping("checkUserId")
    public User checkUserId(Long userId){
        User user = userDao.select(userId);
        if (user == null) throw new  Err("用户ID不存在！");
        return user;
    }

    /**
     * 登录
     * @param userId 用户ID
     * @param password 前端MD5加密后再进行公钥RSA加密的密码
     * @return
     * @throws Exception
     */
    @LogAnnotate(1)
    @PostMapping("login")
    public TokenInfo login(@RequestParam Long userId,@RequestParam String userName,@RequestParam String password) throws Exception {
        TokenInfo tokenInfo = new TokenInfo();
        User user = userDao.select(userId);
        if (user == null){
            throw new Err("用户ID不存在");
        }if (!RSAUtil.decrypt(password.replaceAll(" ","+"),user.getPrivateKey()).equals(user.getPassword())){
            //前端先传用户名获取RSA的publicKey公钥后，进行对密码进行MD5加密后在用RSA的公钥进行加密，然后再传RSA加密后的密码到后端，后端拿到密码进行RSA私钥解密，解密后核对与数据库的密码是否一致。
            throw new Err("密码错误");
        }else {
            //获取当前用户部门组ID
            List<UserDept> userDepts = userDeptDao.selectLoginUserDept(user.getUserId());
            //获取当前用户部门组
            Set<Dept> depts = new HashSet<>();
            for (UserDept userDept:userDepts){
                depts.add(deptDao.select(userDept.getDeptId()));
            }
            //获取当前用户角色组ID
            List<UserRole> userRoles = userRoleDao.selectLoginUserRole(user.getUserId());
            //获取当前用户角色组
            Set<Role> roles = new HashSet<>();
            for (UserRole userRole:userRoles){
                roles.add(roleDao.select(userRole.getRoleId()));
            }
            //先获取当前用户的所有角色ID
            List<Long> roleIds = new ArrayList<>();
            for (UserRole userRole:userRoles){
                roleIds.add(userRole.getRoleId());
            }

            //获取当前用户的所有角色的角色菜单组ID
            Set<Menu> menus = new HashSet<>();
            for (Long roleId:roleIds){
                for (RoleMenu roleMenu:roleMenuDao.selectLoginRoleMenu(roleId)){
                    menus.add(menuDao.select(roleMenu.getMenuId()));
                }
            }

            //设置登录信息TokenInfo
            String token = UUID.randomUUID().toString();
            tokenInfo.setToken(token);
            tokenInfo.setUserId(user.getUserId());
            tokenInfo.setUserName(user.getUserName());
            tokenInfo.setUserDept(depts);
            tokenInfo.setUserRole(roles);
            tokenInfo.setUserRoleMenu(menus);

            //账号密码正确则把相关信息存放到redis并设置过期时间
            redisTemplate.opsForValue().set(token,new ObjectMapper().writeValueAsString(tokenInfo),tokenOvertime, TimeUnit.SECONDS);
            System.out.println(new ObjectMapper().readValue(new ObjectMapper().writeValueAsString(redisTemplate.opsForValue().get(token)),TokenInfo.class));
            return tokenInfo;
        }
    }
}
