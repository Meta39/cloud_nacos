package com.fu.base.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fu.common.aop.IgnoreResAnnotate;
import com.fu.common.util.RSAUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.concurrent.TimeUnit;

/**
 * 测试接口
 */
@RestController
public class HelloController {
    @Resource
    RedisTemplate redisTemplate;

    @IgnoreResAnnotate
    @GetMapping("hello")
    public Boolean hello() throws JsonProcessingException {
        //对象需要序列化成jsonString存放到redis
//        new ObjectMapper().writeValueAsString("对象");
        //判断是否有key
//        redisTemplate.hasKey("1");
        //-------------------------------------------------------
        //set
        redisTemplate.opsForValue().set("m","eta",1500);
        //get
//        System.out.println(redisTemplate.opsForValue().get("m"));
        //--------------------------------------------------------
        //hSet
//        redisTemplate.opsForHash().put("人", "姓名", "meta");
        //设置hSet过期时间
//        redisTemplate.expire("人", 1500, TimeUnit.SECONDS);
        //判断hSet是否有key
//        redisTemplate.opsForHash().hasKey("人", "姓名");
        //获取hSet的key对应item的value数据
//        System.out.println(redisTemplate.opsForHash().get("人", "姓名"));

        return redisTemplate.hasKey("1");
    }

    /**
     * 模拟前端MD5加密后的RSA公钥加密密码
     * @param password
     * @param publicKey
     * @return
     * @throws Exception
     */
    @GetMapping("getPrivateKey")
    public String getPrivateKey(@RequestParam String password,@RequestParam String publicKey) throws Exception {
        String md5Password = Base64.getEncoder().encodeToString(MessageDigest.getInstance("MD5").digest(password.getBytes(StandardCharsets.UTF_8)));//MD5加密密码
        return RSAUtil.encrypt(md5Password,publicKey);
    }
}
