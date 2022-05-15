package com.fu.base.entity;

import java.util.Date;

public class Portal {

    private Long portalId;//门户ID
    private String portalName;//门户名称
    private String portalUrl;//门户url
    private String portalIconUrl;//门户icon_url
    private Long portalSort;//门户排序
    private Boolean disabled;//是否禁用门户
    private String remark;//备注
    private Date createTime;//

    public Long getPortalId() {
        return portalId;
    }

    public void setPortalId(Long portalId) {
        this.portalId = portalId;
    }

    public String getPortalName() {
        return portalName;
    }

    public void setPortalName(String portalName) {
        this.portalName = portalName == null ? null : portalName.trim();
    }

    public String getPortalUrl() {
        return portalUrl;
    }

    public void setPortalUrl(String portalUrl) {
        this.portalUrl = portalUrl == null ? null : portalUrl.trim();
    }

    public String getPortalIconUrl() {
        return portalIconUrl;
    }

    public void setPortalIconUrl(String portalIconUrl) {
        this.portalIconUrl = portalIconUrl == null ? null : portalIconUrl.trim();
    }

    public Long getPortalSort() {
        return portalSort;
    }

    public void setPortalSort(Long portalSort) {
        this.portalSort = portalSort;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}

