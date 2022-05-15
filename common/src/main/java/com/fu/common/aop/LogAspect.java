package com.fu.common.aop;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fu.common.entity.Log;
import com.fu.common.entity.TokenInfo;
import com.fu.common.openfeign.LogFeign;
import feign.FeignException;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.Inet4Address;
import java.net.UnknownHostException;

public class LogAspect {
    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Resource
    RedisTemplate redisTemplate;
    @Resource
    private LogFeign logFeign;

    /**
     * 切点之前执行
     */
//    @Before("@annotation(com.fu.common.aop.LogAnnotate)")
    public void doBefore(JoinPoint point) throws JsonProcessingException {
        //开始打印日志
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        //获取自定义注解的信息
        logger.info("====================================================");
//        logger.info("URL：{}",request.getRequestURL().toString());
//        logger.info("HTTP Method：{}",request.getMethod());
//        logger.info("Class Method：{}.{}",point.getSignature().getDeclaringTypeName(),point.getSignature().getName());
//        logger.info("IP：{}",request.getRemoteAddr());
//        logger.info("Request Args：{}",new ObjectMapper().writeValueAsString(point.getArgs()));
    }

    /**
     * 切点之后执行
     */
//    @After("@annotation(com.fu.common.aop.LogAnnotate)")
    public void  doAfter(){
        logger.info("====================================================");
    }

    /**
     * 抛出异常时执行
     */
    @AfterThrowing(pointcut = "@annotation(com.fu.common.aop.LogAnnotate)&&@annotation(logAnnotate)")
    public void afterThrowing(JoinPoint point, LogAnnotate logAnnotate) throws JsonProcessingException {//logAnnotate对应@AfterThrowing的@annotation(logAnnotate)
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        try {
            if (logAnnotate.value() == 1){
                logFeign.insert(new Log(logAnnotate.value(),request.getRemoteAddr(), Inet4Address.getLocalHost().getHostAddress(),Long.valueOf(request.getParameter("userId")),request.getParameter("userName"),false,null,"URL：" + request.getRequestURL().toString() + "，Request Args：" + new ObjectMapper().writeValueAsString(point.getArgs())));
            }else if (logAnnotate.value() == 2){
                ObjectMapper om = new ObjectMapper();
                TokenInfo tokenInfo = om.readValue(om.writeValueAsString(redisTemplate.opsForValue().get(request.getHeader("token"))),TokenInfo.class);
                logFeign.insert(new Log(logAnnotate.value(),request.getRemoteAddr(), Inet4Address.getLocalHost().getHostAddress(),tokenInfo.getUserId(),tokenInfo.getUserName(),false,null,"URL：" + request.getRequestURL().toString() + "，Request Args：" + new ObjectMapper().writeValueAsString(point.getArgs())));
            }else {
                logFeign.insert(new Log(logAnnotate.value(),request.getRemoteAddr(), Inet4Address.getLocalHost().getHostAddress(),0L,"系统日志",false,null,"URL：" + request.getRequestURL().toString() + "，Request Args：" + new ObjectMapper().writeValueAsString(point.getArgs())));
            }
        }catch (FeignException | UnknownHostException e){
            logger.error("日志系统崩了或其他异常：",e);
        }
    }

    /**
     * 环绕是最后执行的
     */
    @Around("@annotation(com.fu.common.aop.LogAnnotate)&&@annotation(logAnnotate)")
    public Object doAround(ProceedingJoinPoint point, LogAnnotate logAnnotate) throws Throwable{//logAnnotate对应@AfterThrowing的@annotation(logAnnotate)
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        Object result = point.proceed();//执行切点
        try {
            if (logAnnotate.value() == 1){
                logFeign.insert(new Log(logAnnotate.value(),request.getRemoteAddr(), Inet4Address.getLocalHost().getHostAddress(),Long.valueOf(request.getParameter("userId")),request.getParameter("userName"),false,null,"URL：" + request.getRequestURL().toString() + "，Request Args：" + new ObjectMapper().writeValueAsString(point.getArgs())));
            }else if (logAnnotate.value() == 2){
                ObjectMapper om = new ObjectMapper();
                TokenInfo tokenInfo = om.readValue(om.writeValueAsString(redisTemplate.opsForValue().get(request.getHeader("token"))),TokenInfo.class);
                logFeign.insert(new Log(logAnnotate.value(),request.getRemoteAddr(), Inet4Address.getLocalHost().getHostAddress(),tokenInfo.getUserId(),tokenInfo.getUserName(),false,null,"URL：" + request.getRequestURL().toString() + "，Request Args：" + new ObjectMapper().writeValueAsString(point.getArgs())));
            }else {
                logFeign.insert(new Log(logAnnotate.value(),request.getRemoteAddr(), Inet4Address.getLocalHost().getHostAddress(),0L,"系统日志",false,null,"URL：" + request.getRequestURL().toString() + "，Request Args：" + new ObjectMapper().writeValueAsString(point.getArgs())));
            }
        }catch (FeignException e){
            logger.error("日志系统崩了或其他异常：",e);
        }
//        logger.info("Response Args：{}",new ObjectMapper().writeValueAsString(result));//打印参数
//        logger.info("LogAOP param value:{}", logAnnotate.value());
        return result;
    }
}
