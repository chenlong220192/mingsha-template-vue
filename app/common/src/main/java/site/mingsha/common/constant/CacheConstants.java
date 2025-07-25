package site.mingsha.common.constant;

/**
 * 缓存的key 常量
 *
 * @author mingsha
 * @date 2025-07-11
 */
public class CacheConstants {
    /**
     * 登录用户 redis key
     */
    public static final String LOGIN_TOKEN_KEY   = "mingsha-template-vue:login_tokens:";

    /**
     * 验证码 redis key
     */
    public static final String CAPTCHA_CODE_KEY  = "mingsha-template-vue:captcha_codes:";

    /**
     * 参数管理 cache key
     */
    public static final String SYS_CONFIG_KEY    = "mingsha-template-vue:sys_config:";

    /**
     * 字典管理 cache key
     */
    public static final String SYS_DICT_KEY      = "mingsha-template-vue:sys_dict:";

    /**
     * 防重提交 redis key
     */
    public static final String REPEAT_SUBMIT_KEY = "mingsha-template-vue:repeat_submit:";

    /**
     * 限流 redis key
     */
    public static final String RATE_LIMIT_KEY    = "mingsha-template-vue:rate_limit:";

    /**
     * 登录账户密码错误次数 redis key
     */
    public static final String PWD_ERR_CNT_KEY   = "mingsha-template-vue:pwd_err_cnt:";
}
