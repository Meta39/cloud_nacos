package com.fu.base;

import com.fu.common.res.Res;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler extends com.fu.common.global.GlobalExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 参数校验异常
     */
    @ExceptionHandler(BindException.class)
    public Res bindException(BindException e) {
        // 然后提取错误提示信息进行返回
        log.error("参数校验异常：" + e.getBindingResult().getFieldError().getDefaultMessage());
        return Res.err("参数校验异常：" + e.getBindingResult().getFieldError().getDefaultMessage());
    }

    /**
     * 请求参数异常
     */
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public Res missingServletRequestParameterException(MissingServletRequestParameterException e) {
        log.error("请求参数异常" + e);
        return Res.err("缺少请求参数：" + e.getParameterName());
    }
}
