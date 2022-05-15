package com.fu.common.entity;

import java.util.Date;

public class Log {

    private String logId;//日志UUID
    private Integer logType;//日志类型：1登录日志；2操作日志；3系统日志
    private String clientIp;//客户端IP地址
    private String systemIp;//系统IP地址
    private Long userId;//用户ID
    private String userName;//用户名
    private Boolean res;//结果：0失败，1成功
    private Integer failCode;//失败的状态码
    private String content;//内容
    private Date createTime;//创建时间

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId == null ? null : logId.trim();
    }

    public Integer getLogType() {
        return logType;
    }

    public void setLogType(Integer logType) {
        this.logType = logType;
    }

    public String getClientIp() {
        return clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp == null ? null : clientIp.trim();
    }

    public String getSystemIp() {
        return systemIp;
    }

    public void setSystemIp(String systemIp) {
        this.systemIp = systemIp == null ? null : systemIp.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Boolean getRes() {
        return res;
    }

    public void setRes(Boolean res) {
        this.res = res;
    }

    public Integer getFailCode() {
        return failCode;
    }

    public void setFailCode(Integer failCode) {
        this.failCode = failCode;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Log(){}
    public Log(Integer logType, String clientIp, String systemIp, Long userId, String userName, Boolean res, Integer failCode, String content) {
        this.logType = logType;
        this.clientIp = clientIp;
        this.systemIp = systemIp;
        this.userId = userId;
        this.userName = userName;
        this.res = res;
        this.failCode = failCode;
        this.content = content;
    }
}

