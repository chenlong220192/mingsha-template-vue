package site.mingsha.biz.model.vo;

import site.mingsha.common.utils.StringUtils;

/**
 * 缓存信息
 * 
 * @author mingsha
 */
public class SysCacheVO {
    /** 缓存名称 */
    private String cacheName  = "";

    /** 缓存键名 */
    private String cacheKey   = "";

    /** 缓存内容 */
    private String cacheValue = "";

    /** 备注 */
    private String remark     = "";

    public SysCacheVO() {

    }

    public static SysCacheVO newInstance() {
        return new SysCacheVO();
    }

    public static SysCacheVO newInstance(String cacheName, String remark) {
        return new SysCacheVO(cacheName, remark);
    }

    public static SysCacheVO newInstance(String cacheName, String cacheKey, String cacheValue) {
        return new SysCacheVO(cacheName, cacheKey, cacheValue);
    }

    public SysCacheVO(String cacheName, String remark) {
        this.cacheName = cacheName;
        this.remark = remark;
    }

    public SysCacheVO(String cacheName, String cacheKey, String cacheValue) {
        this.cacheName = StringUtils.replace(cacheName, ":", "");
        this.cacheKey = StringUtils.replace(cacheKey, cacheName, "");
        this.cacheValue = cacheValue;
    }

    public String getCacheName() {
        return cacheName;
    }

    public void setCacheName(String cacheName) {
        this.cacheName = cacheName;
    }

    public String getCacheKey() {
        return cacheKey;
    }

    public void setCacheKey(String cacheKey) {
        this.cacheKey = cacheKey;
    }

    public String getCacheValue() {
        return cacheValue;
    }

    public void setCacheValue(String cacheValue) {
        this.cacheValue = cacheValue;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
