package com.fu.gateway.filter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fu.common.res.Res;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * 全局过滤器
 **/
@Component
@RefreshScope //动态刷新@Value的值
public class GlobalFilters implements GlobalFilter, Ordered {
    private static final Logger logger = LoggerFactory.getLogger(GlobalFilters.class);

    @Resource
    private RedisTemplate<String,Object> redisTemplate;

    @Value("${token-overtime}")//token过期时间
    private int tokenOvertime;
    @Value("${not-filter-paths}")//uri白名单用;隔开
    private String notFilterPaths;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
//        ServerHttpRequest.Builder requestBuilder = request.mutate();//修改请求头
        DataBuffer buffer;
        String requestPath = request.getPath().toString(); //前端请求URI
        String token = request.getHeaders().getFirst("token");
        String[] splitNotFilterPaths = notFilterPaths.split(",");
        boolean isNotFilterPath =false;//请求地址是否包含白名单地址
        for (String notFilterPath:splitNotFilterPaths){
            if (requestPath.contains(notFilterPath)){
                isNotFilterPath =true;
                break;
            }
        }

        //uri过滤
        if (isNotFilterPath){
            // 重新设置请求头先删除，后新增
//            requestBuilder.headers(k -> k.remove("要修改的header的key"));
//            if (StringUtils.isBlank(request.getHeaders().getFirst("userId")))requestBuilder.header("userId", "白名单userId");
//            if (StringUtils.isBlank(request.getHeaders().getFirst("userName")))requestBuilder.header("userName", "白名单userName");
            return chain.filter(exchange);
        }else if (StringUtils.isNotBlank(token) && redisTemplate.hasKey(token)){//是否有token
            redisTemplate.opsForValue().set(token, Objects.requireNonNull(redisTemplate.opsForValue().get(token)),tokenOvertime, TimeUnit.SECONDS);//重新设置redis过期时间
            return chain.filter(exchange);
        }else {//返回错误信息前端
            Res res = new Res();
            res.setCode(-1);
            res.setMsg("token已过期，请重新登录");

            byte[] bytes = new byte[0];
            try {
                bytes = new ObjectMapper().writeValueAsBytes(res);
            } catch (JsonProcessingException e) {
                logger.error("错误信息转换异常！"+e);
            }
            buffer = response.bufferFactory().wrap(bytes);
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
            return response.writeWith(Mono.just(buffer));
        }


    }

    /**
     * 权重，值越小优先级越高
     */
    @Override
    public int getOrder() {
        return 0;
    }
}
