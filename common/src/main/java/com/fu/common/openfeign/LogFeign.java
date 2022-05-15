package com.fu.common.openfeign;

import com.fu.common.entity.Log;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * RequestParam必须写参数名称，否则Get请求调用失败。
 */
@FeignClient(name="base")//name是注册中心的name。注意区分大小写。
public interface LogFeign {
    @PostMapping("logPassive/insert")
    Integer insert(@RequestBody Log log);

    @GetMapping("logPassive/select")
    Log select(@RequestParam("id") Long id);
}
