package com.fu.common.global;

import com.fu.common.res.Err;
import com.fu.common.res.Res;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

public class GlobalExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 打印详细异常日志信息
     */
    public static String getExceptionDetail(Exception ex) {
        String ret = null;
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            PrintStream pout = new PrintStream(out);
            ex.printStackTrace(pout);
            ret = out.toString();
            pout.close();
            out.close();
        } catch (Exception ignored) {
        }
        return ret;
    }

    /**
     * 空指针异常
     */
    @ExceptionHandler(value = NullPointerException.class)
    public Res exceptionHandler(NullPointerException e) {
        log.error("空指针异常" + getExceptionDetail(e));
        return Res.err("空指针异常");
    }

    /**
     * 其他异常
     */
    @ExceptionHandler(value = Exception.class)
    public Res exception(Exception e) {
        log.error("500异常：{}" + getExceptionDetail(e));
        return Res.err(getExceptionDetail(e));
    }


    /**
     * 自定义异常
     */
    @ExceptionHandler(value = Err.class)
    public Res Err(Err e) {
        return e.getCode() == 0 ? Res.err(e.getMsg()) : Res.err(e.getCode(), e.getMsg());
    }

}
